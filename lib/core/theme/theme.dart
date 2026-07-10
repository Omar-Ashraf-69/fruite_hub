import 'package:flutter/material.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';

class AppThemes {
  static ThemeData lightTheme() {
    return ThemeData(
      fontFamily: 'Cairo',
      scaffoldBackgroundColor: Colors.white,
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
    );
  }
}
