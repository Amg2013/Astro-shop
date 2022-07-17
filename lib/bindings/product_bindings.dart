import 'package:get/get.dart';
import 'package:shooping_app/controller/product_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(ProductController());
  }
}
