import 'package:get/get.dart';
import '../controller/main_controller.dart';
import '../controller/payment_controller.dart';
import '../controller/settings_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(SettingsController(), permanent: true);
    Get.put(PaymentController(), permanent: true);
  }
}
