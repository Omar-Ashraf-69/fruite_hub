import 'package:fruit_hub/features/cart/domain/entities/cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> items;

  CartEntity({required this.items});

  int totalPrice() {
    int total = 0;
    for (var item in items) {
      total += item.productPrice().toInt();
    }
    return total;
  }

  bool isProductInCart(CartItemEntity product) {
    for (var item in items) {
      if (item == product) return true;
    }
    return false;
  }

  void addProduct(CartItemEntity item) {
    if (isProductInCart(item)) {
      for (var i = 0; i < items.length; i++) {
        if (items[i].product.code == item.product.code) {
          items[i].incrementCounter();
          return;
        }
      }
    }
    items.add(item);
  }

  void removeProduct(String code) {
    for (var i = 0; i < items.length; i++) {
      if (items[i].product.code == code) {
        items.removeAt(i);
        return;
      }
    }
  }
}
