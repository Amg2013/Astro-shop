import 'package:get/get.dart';

class AuthController extends GetxController {
  bool isVisibility = false;
  bool isCheckBox = false;

  void visibility() {
    isVisibility = !isVisibility;
    update();
  }

  void checkBox() {
    isCheckBox = !isCheckBox;
    update();
  }
}
