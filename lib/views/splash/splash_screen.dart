import 'package:bloc_clean_coding/services/splash/splash_service.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashService splashService = SplashService();

  @override
  void initState() {
    super.initState();

    splashService.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Splash Screen')));
  }
}
