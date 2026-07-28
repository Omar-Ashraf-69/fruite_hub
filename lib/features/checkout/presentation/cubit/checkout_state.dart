part of 'checkout_cubit.dart';

class CheckoutState {
  const CheckoutState();
}

final class CheckoutInitial extends CheckoutState {}
final class CheckoutPaymentMethod extends CheckoutState {}
final class CheckoutAddressSaved extends CheckoutState {}

final class AddOrderLoading extends CheckoutState {}
final class AddOrderSuccess extends CheckoutState {}
final class AddOrderFailure extends CheckoutState {
  final String message;
  AddOrderFailure(this.message);
}
final class EmptyCart extends CheckoutState {}
