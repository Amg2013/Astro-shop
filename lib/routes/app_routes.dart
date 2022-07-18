import 'package:get/get.dart';
import 'package:shooping_app/bindings/auth_bindings.dart';
import 'package:shooping_app/bindings/main_bindings.dart';
import 'package:shooping_app/bindings/product_bindings.dart';
import 'package:shooping_app/view/screens/auth/forgot_screen.dart';
import 'package:shooping_app/view/screens/cart_screen.dart';
import 'package:shooping_app/view/screens/main_screen.dart';

import '../view/screens/auth/login.dart';
import '../view/screens/auth/sign_up.dart';
import '../view/screens/welcome_screen.dart';

class AppRoutes {
  static const welcomeRoute = '/welcome';
  static const signUpScreenRoute = '/signup';
  static const loginScreenRoute = '/login';
  static const forgetPasswordScreenRoute = '/forget_password';
  static const mainScreenRoute = '/main_screen';
  static const cartScreenRoute = '/cart_screen';

  static final routes = [
    GetPage(name: welcomeRoute, page: () => const WelcomeScreen()),
    GetPage(
        name: signUpScreenRoute,
        page: () => SignUpScreen(),
        binding: AuthBinding()),
    GetPage(
        name: loginScreenRoute,
        page: () => LoginScreen(),
        binding: AuthBinding()),
    GetPage(
        name: AppRoutes.forgetPasswordScreenRoute,
        page: () => ForgetPasswordScreen(),
        binding: AuthBinding()),
    GetPage(
      name: AppRoutes.mainScreenRoute,
      page: () => MainScreen(),
      bindings: [AuthBinding(), MainBinding(), ProductBinding()],
    ),
    GetPage(
      name: AppRoutes.cartScreenRoute,
        page: () => CartScreen(),
        bindings: [AuthBinding(), ProductBinding()]),
  ];
}
