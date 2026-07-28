import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit_hub/core/enums/order_status.dart';
import 'package:fruit_hub/core/enums/payment_status.dart';
import 'package:fruit_hub/features/checkout/domain/entities/checkout_entity.dart';
import 'address_model.dart';
import 'order_product_model.dart';


class OrderModel {
  final String orderId;
  final String userId;

  final double totalPrice;

  final AddressModel shippingAddress;

  final List<OrderProductModel> products;

  final String paymentMethod;

  final PaymentStatus paymentStatus;

  final OrderStatusEnum status;

  final String? paypalOrderId;

  OrderModel({
    required this.orderId,
    required this.userId,
    required this.totalPrice,
    required this.shippingAddress,
    required this.products,
    required this.paymentMethod,
    required this.paymentStatus,
    required this.status,
    this.paypalOrderId,
  });

  factory OrderModel.fromEntity({
    required CheckoutEntity checkout,
    required String orderId,
    required String userId,
    String? paypalOrderId,
  }) {
    return OrderModel(
      orderId: orderId,
      userId: userId,
      totalPrice: checkout.cart.totalPrice(),
      shippingAddress: AddressModel.fromEntity(checkout.address!),
      products: checkout.cart.items.map(OrderProductModel.fromEntity).toList(),
      paymentMethod: checkout.paymentMethod!.name,
      paymentStatus: checkout.paymentMethod!.name == 'paypal'
          ? PaymentStatus.paid
          : PaymentStatus.unpaid,
      status: OrderStatusEnum.pending,
      paypalOrderId: paypalOrderId,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'userId': userId,
      'totalPrice': totalPrice,
      'paymentMethod': paymentMethod,
      'paymentStatus': paymentStatus.name,
      'status': status.name,
      'paypalOrderId': paypalOrderId,
      'shippingAddress': shippingAddress.toJson(),
      'products': products.map((e) => e.toJson()).toList(),
      'createdAt': FieldValue.serverTimestamp(),
    };
  }
}
