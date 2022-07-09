import 'package:get/get.dart';

class AuthController extends GetxController {
  bool isVisibility = false;

  void visibility() {
    isVisibility = !isVisibility;
    update();
  }
}
