import 'package:flutter/material.dart';
import 'package:fruit_hub/core/routing/app_routes.dart';
import 'package:fruit_hub/features/auth/features/login/presentation/views/login_view.dart';
import 'package:fruit_hub/features/onboarding/presentation/views/onboarding_view.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.onBoarding:
        return _buildRoute(const OnBoardingView());
      case AppRoutes.login:
        return _buildRoute(const LoginView());
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
