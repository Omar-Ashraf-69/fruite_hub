import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/cart/domain/entities/cart_entity.dart';
import 'package:fruit_hub/features/checkout/domain/entities/address_entity.dart';
import 'package:fruit_hub/features/checkout/domain/entities/checkout_entity.dart';
import 'package:fruit_hub/features/checkout/domain/entities/payment_method.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit({required this.cart}) : super(CheckoutInitial()) {
    checkout = CheckoutEntity(cart: cart);
  }
  final CartEntity cart;

  late CheckoutEntity checkout;

  void selectPaymentMethod({required PaymentMethod method}) {
    checkout.paymentMethod = method;
    emit(CheckoutPaymentMethod());
  }


  void saveAddress(AddressEntity address) {
    checkout.address = address;
    emit(CheckoutAddressSaved());
  }

  int totalPrice() {
    return cart.totalPrice() + 10;
  }

  bool canContinueFromPaymentStep() {
  return checkout.paymentMethod != null;
}
}
