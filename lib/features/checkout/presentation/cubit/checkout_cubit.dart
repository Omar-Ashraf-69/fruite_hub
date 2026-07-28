import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/enums/payment_method.dart';
import 'package:fruit_hub/core/repos/add_product/add_order_repo.dart';
import 'package:fruit_hub/features/cart/domain/entities/cart_entity.dart';
import 'package:fruit_hub/features/checkout/domain/entities/address_entity.dart';
import 'package:fruit_hub/features/checkout/domain/entities/checkout_entity.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit({required this.cart, required this.ordersRepo})
    : super(CheckoutInitial()) {
    checkout = CheckoutEntity(cart: cart);
  }
  final CartEntity cart;
  final AddOrderRepo ordersRepo;

  late CheckoutEntity checkout;

  void selectPaymentMethod({required PaymentMethod method}) {
    checkout.paymentMethod = method;
    emit(CheckoutPaymentMethod());
  }

  void saveAddress(AddressEntity address) {
    checkout.address = address;
    emit(CheckoutAddressSaved());
  }

  double totalPrice() {
    return cart.totalPrice() + 10;
  }

  bool canContinueFromPaymentStep() {
    return checkout.paymentMethod != null;
  }

  Future<void> addOrder() async {
    emit(AddOrderLoading());
    final result = await ordersRepo.addOrder(orderEntity: checkout);
    result.fold(
      (failure) => emit(AddOrderFailure(failure.message)),
      (success) => emit(AddOrderSuccess()),
    );
  }

  void deleteOrder() async {
    emit(AddOrderLoading());
    checkout.cart.clearCart();
    emit(EmptyCart());
  }
}
