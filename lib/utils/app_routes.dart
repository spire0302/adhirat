import 'package:adhirat/modules/album_module/pages/book_details_screen.dart';
import 'package:adhirat/modules/auth_module/pages/forgot_password.dart';
import 'package:adhirat/modules/auth_module/pages/login.dart';
import 'package:adhirat/modules/auth_module/pages/reset_password.dart';
import 'package:adhirat/modules/dashboard/pages/dashboard.dart';
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
        case RouteString.FOEROT_SCREEN:
          return ForgotPassword();
        case RouteString.RESET_PASSWORD:
          return ResetPasswordScreen();
        case RouteString.DASHBOARD:
          return DashBoadScreen();
        case RouteString.BOOK_DETAILS:
          return BookDetailscreen();
        default:
          return const SplashScreen();
      }
    });
  }
}
