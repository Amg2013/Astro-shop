import 'package:get/get.dart';
import 'package:shooping_app/bindings/auth_bindings.dart';

import '../view/screens/auth/login.dart';
import '../view/screens/auth/sign_up.dart';
import '../view/screens/welcome_screen.dart';

class AppRoutes {
  static const welcomeRoute = '/welcome';
  static const signUpScreenRoute = '/signup';
  static const loginScreenRoute = '/login';
  static final routes = [
    GetPage(name: welcomeRoute, page: () => const WelcomeScreen()),
    GetPage(
        name: signUpScreenRoute,
        page: () => SignUpScreen(),
        binding: AuthBinding()),
    GetPage(name: loginScreenRoute, page: () => const LoginScreen()),
  ];
}
