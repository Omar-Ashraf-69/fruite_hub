import 'package:flutter/material.dart';
import 'package:fruit_hub/core/auth/firebase_auth_service.dart';
import 'package:fruit_hub/core/di/dependecny_injection.dart';
import 'package:fruit_hub/core/helpers/extenstions.dart';
import 'package:fruit_hub/core/routing/app_routes.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            getIt<FirebaseAuthService>().signOut();
            context.pushNamedAndRemoveAll(AppRoutes.login);
          },
          child: Text("LogOut"),
        ),
      ),
    );
  }
}
