import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/core/constants/endpoints.dart';
import 'package:fruit_hub/core/errors/failures.dart';
import 'package:fruit_hub/core/repos/add_product/add_order_repo.dart';
import 'package:fruit_hub/core/services/data_service.dart';
import 'package:fruit_hub/features/checkout/data/order_model.dart';
import 'package:fruit_hub/features/checkout/domain/entities/checkout_entity.dart';
import 'package:uuid/uuid.dart';

class AddOrderRepoImpl implements AddOrderRepo {
  final DatabaseService databaseService;
  final FirebaseAuth firebaseAuth;

  AddOrderRepoImpl(this.databaseService, this.firebaseAuth);
  @override
  Future<Either<Failure, void>> addOrder({
    required CheckoutEntity orderEntity,
  }) async {
    try {
      final orderId = const Uuid().v4();
      final userId = firebaseAuth.currentUser!.uid;

      final order = OrderModel.fromEntity(
        checkout: orderEntity,
        orderId: orderId,
        userId: userId,
      );

      await databaseService.addData(
        path: BackendEndpoints.setOrders,
        documentId: orderId,
        data: order.toJson(),
      );

      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
