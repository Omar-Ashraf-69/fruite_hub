
  import 'package:flutter/widgets.dart';

String? validator(String? value, String name, BuildContext context) {
    if (value == null || value.trim().isEmpty) {
      return 'This $name is required';
    }
    return null;
  }