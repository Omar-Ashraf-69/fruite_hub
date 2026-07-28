import 'package:fruit_hub/features/cart/domain/entities/cart_item_entity.dart';

class OrderProductModel {
  final String code;
  final String name;
  final String? imageUrl;
  final double price;
  final int quantity;
  final int unitAmount;

  const OrderProductModel({
    required this.code,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.quantity,
    required this.unitAmount,
  });

  factory OrderProductModel.fromEntity(CartItemEntity item) {
    return OrderProductModel(
      code: item.product.code,
      name: item.product.name,
      imageUrl: item.product.imageUrl,
      price: item.product.price,
      quantity: item.counter,
      unitAmount: item.product.unitAmount,
    );
  }

  factory OrderProductModel.fromJson(Map<String, dynamic> json) {
    return OrderProductModel(
      code: json['code'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      price: json['price'],
      quantity: json['quantity'],
      unitAmount: json['unitAmount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'name': name,
      'imageUrl': imageUrl,
      'price': price,
      'quantity': quantity,
      'unitAmount': unitAmount,
    };
  }
}