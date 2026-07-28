import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/features/cart/domain/entities/cart_entity.dart';
import 'package:fruit_hub/features/cart/domain/entities/cart_item_entity.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  CartEntity cart = CartEntity(items: []);
  void addToCart(ProductEntity product) {
    cart.addProduct(CartItemEntity(product: product));
    emit(CartItemAdded());
  }

  void removeFromCart(String code) {
    cart.removeProduct(code);
    emit(CartItemRemoved());
  }

  void clearCart() {
    cart.clearCart();
    emit(CartCleared());
  }
}
