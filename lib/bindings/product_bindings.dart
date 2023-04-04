import 'package:get/get.dart';
import 'package:shooping_app/controller/cart_controller.dart';
import 'package:shooping_app/controller/category_controller.dart';
import 'package:shooping_app/controller/product_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductController());
    Get.lazyPut(() => CartController());
    Get.put(CategoryController());
  }
}
