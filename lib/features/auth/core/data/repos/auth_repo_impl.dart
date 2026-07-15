import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/auth/auth_remote_data_source.dart';
import 'package:fruit_hub/core/errors/exceptions.dart';
import 'package:fruit_hub/core/errors/failures.dart';
import 'package:fruit_hub/features/auth/core/data/models/user_model.dart';
import 'package:fruit_hub/features/auth/core/domain/entites/user_entity.dart';
import 'package:fruit_hub/features/auth/core/domain/repos/auth_repo.dart';
import 'package:fruit_hub/generated/l10n.dart';

class AuthRepoImpl implements AuthRepo {
  const AuthRepoImpl({required this._remoteDataSource});

  final AuthRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String emailAddress,
    required String password,
    required String name,
  }) async {
    return await _executeAuthOperation(
      () => _remoteDataSource.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
        name: name,
      ),
      methodName: "AuthRepoImpl.createUserWithEmailAndPassword",
    );

  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword({
    required String emailAddress,
    required String password,
  }) async {
    return await _executeAuthOperation(
      () => _remoteDataSource.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      ),
      methodName: "AuthRepoImpl.signInWithEmailAndPassword",
    );
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    return await _executeAuthOperation(
      () => _remoteDataSource.signInWithGoogle(),
      methodName: "AuthRepoImpl.signInWithGoogle",
    );
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    return await _executeAuthOperation(
      () => _remoteDataSource.signInWithFacebook(),
      methodName: "AuthRepoImpl.signInWithFacebook",
    );
  }

  Future<Either<Failure, UserEntity>> _executeAuthOperation(
    Future<UserModel> Function() operation, {
    required String methodName,
  }) async {
    try {
      final userModel = await operation();
      return Right(userModel.toEntity());
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e, stackTrace) {
      log('AuthRepoImpl.$methodName', error: e, stackTrace: stackTrace);

      return Left(ServerFailure(S.current.unexpected_error));
    }
  }
}
