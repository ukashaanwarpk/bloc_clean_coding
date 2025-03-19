import 'dart:async'; 

import 'package:bloc_clean_coding/config/routes/route_name.dart';
import 'package:flutter/material.dart'; 


import '../session_manager/session_controller.dart'; 

class SplashServices {

  void checkAuthentication(BuildContext context) async {
    SessionController().getUserData().then((value) async {
      if (SessionController.isLogin ?? false) {
        Timer(
          const Duration(seconds: 2),
          () => Navigator.pushNamedAndRemoveUntil(context, RouteName.home, (route) => false),
        );
      } else {
        Timer(
          const Duration(seconds: 2),
          () => Navigator.pushNamedAndRemoveUntil(context, RouteName.login, (route) => false),
        );
      }
    }).onError((error, stackTrace) {
      Timer(
        const Duration(seconds: 2),
        () => Navigator.pushNamedAndRemoveUntil(context, RouteName.login, (route) => false),
      );
    });
  }
}