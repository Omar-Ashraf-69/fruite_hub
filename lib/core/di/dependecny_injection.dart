import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fruit_hub/core/auth/auth_remote_data_source.dart';
import 'package:fruit_hub/core/auth/auth_remote_data_source_impl.dart';
import 'package:fruit_hub/core/auth/firebase_auth_service.dart';
import 'package:fruit_hub/core/services/user_remote_data_source.dart';
import 'package:fruit_hub/core/services/firestore_service.dart';
import 'package:fruit_hub/features/auth/core/data/repos/auth_repo_impl.dart';
import 'package:fruit_hub/features/auth/core/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Shared Preferences
  await _registerSharedPreferences();
  //Secure Storage
  _registerSecureStorage();
  _registerAuthDependencies();
  _registerRemoteDataSourceDependencies();
}

void _registerSecureStorage() {
  const flutterSecureStorage = FlutterSecureStorage();
  getIt.registerSingleton<FlutterSecureStorage>(flutterSecureStorage);
}

Future<void> _registerSharedPreferences() async {
  final prefs = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(prefs);
}

void _registerAuthDependencies() {
  // Firebase SDK
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  getIt.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn.instance);
  getIt.registerLazySingleton<FacebookAuth>(() => FacebookAuth.instance);
  // Services
  getIt.registerLazySingleton<FirebaseAuthService>(
    () => FirebaseAuthService(
      instance: getIt<FirebaseAuth>(),
      googleSignIn: getIt<GoogleSignIn>(),
      facebookAuth: getIt<FacebookAuth>(),
    ),
  );

  // Remote Data Sources
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      firebaseAuthService: getIt<FirebaseAuthService>(),
    ),
  );

  // Repositories
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(
      remoteDataSource: getIt<AuthRemoteDataSource>(),
      userRemoteDataSourceRepo: getIt<UserRemoteDataSource>(),
    ),
  );
}

void _registerRemoteDataSourceDependencies() {
  getIt.registerLazySingleton<FirestoreService>(
    () => FirestoreService(FirebaseFirestore.instance),
  );

  getIt.registerLazySingleton<UserRemoteDataSource>(
    () => getIt<FirestoreService>(),
  );
}
