import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helpers/app_initializer.dart';
import 'package:fruit_hub/core/localization/locale_provider.dart';
import 'package:fruit_hub/core/routing/app_router.dart';
import 'package:fruit_hub/fruit_hub_app.dart';
import 'package:provider/provider.dart';

void main() async {
   final initializer = AppInitializer();
  await initializer.initialize();
  runApp(
    ChangeNotifierProvider(
      create: (context) => LocaleProvider(),
      child: FruitHubApp(
        appRouter: AppRouter(),
        initialRoute: initializer.getInitialRoute(),
      ),
    ),
  );
}
