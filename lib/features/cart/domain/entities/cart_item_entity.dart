import 'package:equatable/equatable.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';

// ignore: must_be_immutable
class CartItemEntity extends Equatable {
  final ProductEntity product;
  int counter;

  CartItemEntity({required this.product, this.counter = 1});
  void incrementCounter() {
    counter++;
  }

  void decrementCounter() {
    if (counter == 1) return;
    counter--;
  }

  double productPrice() {
    return product.price * counter;
  }

  num calculateTotalWeight() {
    return product.unitAmount * counter;
  }

  @override
  List<Object?> get props => [product];
}
