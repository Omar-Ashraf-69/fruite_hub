import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/auth/firebase_auth_service.dart';
import 'package:fruit_hub/core/constants/pref_keys.dart';
import 'package:fruit_hub/core/di/dependecny_injection.dart';
import 'package:fruit_hub/core/routing/app_routes.dart';
import 'package:fruit_hub/core/utils/custom_bloc_observer.dart';
import 'package:fruit_hub/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppInitializer {
  Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();

    await ScreenUtil.ensureScreenSize();
    Bloc.observer = CustomBlocObserver();
    await setupGetIt();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  String getInitialRoute() {
    final prefs = getIt<SharedPreferences>();
    final onboardingSeen = prefs.getBool(PrefKeys.isOnboardingSeen) ?? false;

    if (!onboardingSeen) {
      return AppRoutes.onBoarding;
    }
    final authService = getIt<FirebaseAuthService>();

    if (authService.currentUser == null) {
      return AppRoutes.login;
    }

    return AppRoutes.main;
  }
}
