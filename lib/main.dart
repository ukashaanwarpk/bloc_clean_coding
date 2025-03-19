import 'package:bloc_clean_coding/config/routes/route_name.dart';
import 'package:bloc_clean_coding/repository/auth/auth_http_api_repository.dart';
import 'package:bloc_clean_coding/repository/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'config/routes/routes.dart';



GetIt getIt = GetIt.instance;

void main() {
  serviceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: RouteName.splash,
      onGenerateRoute: Routes.generateRoute,
      
    );
  }
}


void serviceLocator() {
  getIt.registerLazySingleton<LoginRepository>(() => AuthHttpApiRepository(),);
}