import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';

class Utils {
  static bool emailValidator(String email) {
    bool isValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(email);
    return isValid;
  }

  static void changeFocus(
    BuildContext context,
    FocusNode currentFocus,
    FocusNode nextFocus,
  ) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static void showErrorMessage(BuildContext context, String message) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        message: message,
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
        icon: const Icon(Icons.error, color: Colors.white),
        borderRadius: BorderRadius.circular(10),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        reverseAnimationCurve: Curves.decelerate,
        forwardAnimationCurve: Curves.elasticIn,
      )..show(context),
    );
  }
  static void showSuccessMessage(BuildContext context, String message) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        message: message,
        flushbarPosition: FlushbarPosition.TOP,
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 3),
        icon: const Icon(Icons.check, color: Colors.white),
        borderRadius: BorderRadius.circular(10),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        reverseAnimationCurve: Curves.decelerate,
        forwardAnimationCurve: Curves.elasticIn,
      )..show(context),
    );
  }
}
