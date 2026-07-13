 import 'package:flutter/material.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';

Future<dynamic> loadingDialog(BuildContext context) {
    return showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => const Center(
            child: CircularProgressIndicator(color: AppColors.primaryColor),
          ),
        );
  }