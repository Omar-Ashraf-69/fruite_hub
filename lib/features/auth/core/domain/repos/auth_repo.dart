import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/errors/failures.dart';
import 'package:fruit_hub/features/auth/core/domain/entites/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String emailAddress,
    required String password,
    required String name,
  });

  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword({
    required String emailAddress,
    required String password,
  });

  Future<Either<Failure, UserEntity>> signInWithGoogle();


  Future<Either<Failure, UserEntity>> signInWithFacebook();
}
