import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/di/dependecny_injection.dart';
import 'package:fruit_hub/core/localization/locale_provider.dart';
import 'package:fruit_hub/fruit_hub_app.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await setupGetIt();
  runApp(
    ChangeNotifierProvider(
      create: (context) => LocaleProvider(),
      child: FruitHubApp(),
    ),
  );
}
