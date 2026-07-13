import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/di/dependecny_injection.dart';
import 'package:fruit_hub/firebase_options.dart';

class AppInitializer {
  Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();

    await ScreenUtil.ensureScreenSize();

  await setupGetIt();
    await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
    
  }


}