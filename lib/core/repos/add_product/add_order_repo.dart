import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/errors/failures.dart';
import 'package:fruit_hub/features/checkout/domain/entities/checkout_entity.dart';

abstract class AddOrderRepo {
  Future<Either<Failure, void>> addOrder({required CheckoutEntity orderEntity});
}
