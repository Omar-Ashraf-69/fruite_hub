import 'package:fruit_hub/core/helpers/app_regex.dart';

class AppValidators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty || !AppRegex.isEmailValid(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      !AppRegex.isPasswordValid(value!);
      return 'Please enter a valid password';
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a valid Name';
    }
    return null;
  }
}
