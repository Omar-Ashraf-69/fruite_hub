import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/di/dependecny_injection.dart';
import 'package:fruit_hub/core/routing/app_routes.dart';
import 'package:fruit_hub/features/auth/core/domain/repos/auth_repo.dart';
import 'package:fruit_hub/features/auth/features/login/presentation/cubit/login_cubit.dart';
import 'package:fruit_hub/features/auth/features/login/presentation/views/login_view.dart';
import 'package:fruit_hub/features/auth/features/signup/presentation/cubit/signup_cubit.dart';
import 'package:fruit_hub/features/auth/features/signup/presentation/views/signup_view.dart';
import 'package:fruit_hub/features/checkout/presentation/checkout_view.dart';
import 'package:fruit_hub/features/home/presentation/views/home_view.dart';
import 'package:fruit_hub/features/main/presentation/views/main_view.dart';
import 'package:fruit_hub/features/onboarding/presentation/views/onboarding_view.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.onBoarding:
        return _buildRoute(const OnBoardingView());
      case AppRoutes.login:
        return _buildRoute(
          BlocProvider(
            create: (context) => LoginCubit(repo: getIt<AuthRepo>()),
            child: const LoginView(),
          ),
        );
      case AppRoutes.signup:
        return _buildRoute(
          BlocProvider(
            create: (context) => SignUpCubit(repo: getIt<AuthRepo>()),
            child: const SignUpView(),
          ),
        );
      case AppRoutes.home:
        return _buildRoute(const HomeView());
      case AppRoutes.main:
        return _buildRoute(const MainView());
      case AppRoutes.checkout:
        return _buildRoute(const CheckoutView());
      default:
        return _buildRoute(
          Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }

  Route<dynamic> _buildRoute(Widget page) {
    return MaterialPageRoute(builder: (_) => page);
  }
}
