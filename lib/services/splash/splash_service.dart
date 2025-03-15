import 'dart:async';
import 'package:bloc_clean_coding/config/routes/route_name.dart';
import 'package:flutter/material.dart';

class SplashService {
  void isLogin(BuildContext context) {
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushNamedAndRemoveUntil(
        context,
        RouteName.login,
        (route) => false,
      ),
    );
  }
}
