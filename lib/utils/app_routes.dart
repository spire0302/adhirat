import 'package:adhirat/modules/auth_module/pages/login.dart';
import 'package:adhirat/utils/route_string.dart';
import 'package:flutter/material.dart';

import '../modules/auth_module/pages/register.dart';
import '../modules/auth_module/pages/splash.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    return MaterialPageRoute(builder: (context) {
      switch (settings.name) {
        case RouteString.SPLASH_SCREEN:
          return const SplashScreen();
        case RouteString.LOGIN_SCREEN:
          return const LoginScreen();
        case RouteString.REGISTER_SCREEN:
          return const RegisterScreen();
        default:
          return const SplashScreen();
      }
    });
  }
}
