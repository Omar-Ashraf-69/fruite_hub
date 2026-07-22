import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';

class ToastNoContext {
  static void showLongToast() {
    Fluttertoast.showToast(
      msg: "This is Long Toast",
      toastLength: Toast.LENGTH_LONG,
      fontSize: 18.0,
    );
  }

  static void showWebColoredToast({required String message}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      webBgColor: "#e74c3c",
      textColor: Colors.black,
      timeInSecForIosWeb: 5,
    );
  }

  static void showColoredToast({required String message}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: AppColors.lightPrimaryColor,
      textColor: Colors.white,
    );
  }

  static void showShortToast({required String message}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 1,
    );
  }

  static void showTopShortToast({required String message}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
    );
  }

  static void showCenterShortToast({required String message}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
    );
  }

  static void cancelToast() {
    Fluttertoast.cancel();
  }
}
