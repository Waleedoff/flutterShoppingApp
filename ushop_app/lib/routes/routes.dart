import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:ushop_app/logic/bindings/auth_binding.dart';
import 'package:ushop_app/logic/bindings/main_binding.dart';
import 'package:ushop_app/logic/bindings/product_binding.dart';
import 'package:ushop_app/view/screens/cart_screen.dart';
import 'package:ushop_app/view/screens/auth/forgot_password_screen.dart';
import 'package:ushop_app/view/screens/auth/login_screen.dart';
import 'package:ushop_app/view/screens/auth/signup_screen.dart';
import 'package:ushop_app/view/screens/main_screen.dart';
import 'package:ushop_app/view/screens/welcome_screen.dart';

class AppRoutes {
  //initialRoute
  static const welcome = Routes.WelcomeScreen;
  static const mainScreen = Routes.mainScreen;
  //getPages
  static final routes = [
    GetPage(
      name: Routes.WelcomeScreen,
      page: () => const WelcomeScreen(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.signUpScreen,
      page: () => SignUpScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.forgotPasswordScreen,
      page: () => ForgotPasswordScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.mainScreen,
      page: () => MainScreen(),
      bindings: [AuthBinding(), MainBininding(), ProudctBinding()],
    ),
    GetPage(
      name: Routes.cartScreen,
      page: () => CarScreen(),
      binding: AuthBinding(),
    ),
  ];
}

class Routes {
  static const WelcomeScreen = '/welcomeScreen';
  static const loginScreen = '/loginScreen';
  static const signUpScreen = '/signUpScreen';
  static const forgotPasswordScreen = '/forgotPasswordScreen';
  static const mainScreen = '/mainScreen';
  static const cartScreen = '/cartScreen';
}
