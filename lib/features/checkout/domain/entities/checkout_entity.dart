import 'package:fruit_hub/core/enums/payment_method.dart';
import 'package:fruit_hub/features/cart/domain/entities/cart_entity.dart';
import 'package:fruit_hub/features/checkout/domain/entities/address_entity.dart';

class CheckoutEntity {
  final CartEntity cart;
  AddressEntity? address;
  PaymentMethod? paymentMethod;

  CheckoutEntity({required this.cart, this.address, this.paymentMethod});

  CheckoutEntity copyWith({
    CartEntity? cart,
    AddressEntity? address,
    PaymentMethod? paymentMethod,
  }) {
    return CheckoutEntity(
      cart: cart ?? this.cart,
      address: address ?? this.address,
      paymentMethod: paymentMethod ?? this.paymentMethod,
    );
  }
}
