import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/cart/domain/entities/cart_entity.dart';
import 'package:fruit_hub/features/checkout/data/address_controllers.dart';
import 'package:fruit_hub/features/checkout/domain/entities/address_entity.dart';
import 'package:fruit_hub/features/checkout/domain/entities/checkout_entity.dart';
import 'package:fruit_hub/features/checkout/domain/entities/payment_method.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit({required this.cart}) : super(CheckoutInitial());
  final CartEntity cart;
  late CheckoutEntity checkout = CheckoutEntity(cart: cart);
  final addressControllers = AddressControllers();
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

  void selectPaymentMethod({required PaymentMethod method}) {
    checkout.paymentMethod = method;
    emit(CheckoutPaymentMethod());
  }
  int totalPrice() {
    return cart.totalPrice() + 10;
  }

  void saveAddress() {
    checkout.address = AddressEntity(
      fullName: addressControllers.fullName.text,
      email: addressControllers.email.text,
      address: addressControllers.address.text,
      city: addressControllers.city.text,
      floor: addressControllers.floor.text,
      phone: addressControllers.phone.text,
    );
    emit(CheckoutAddressSaved());
  }
}
