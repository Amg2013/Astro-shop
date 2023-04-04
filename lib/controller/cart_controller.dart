import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shooping_app/model/product_models.dart';
import 'package:shooping_app/routes/app_routes.dart';
import '../config/themes/theme.dart';

class CartController extends GetxController {
  var productMap = {}.obs;

  void addProductToCart(ProductModels productModels) {
    if (productMap.containsKey(productModels)) {
      productMap[productModels] += 1;
    } else {
      productMap[productModels] = 1;
    }
  }

  void removeProductFromCart(ProductModels productModels) {
    if (productMap.containsKey(productModels) &&
        productMap[productModels] == 1) {
      productMap.removeWhere((key, value) => key == productModels);
    } else {
      productMap[productModels] -= 1;
    }
  }

  void removeOneProduct(ProductModels productModels) {
    productMap.removeWhere((key, value) => key == productModels);
  }

  void clearAllProducts() {
    Get.defaultDialog(
        title: "Clear Products".tr,
        titleStyle: TextStyle(
          color: Get.isDarkMode ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        middleText: 'Are you sure need to clear products ?'.tr,
        middleTextStyle: TextStyle(
          color: Get.isDarkMode ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        radius: 10,
        textCancel: 'No'.tr,
        cancelTextColor: Get.isDarkMode ? Colors.white : Colors.black,
        textConfirm: 'Yes'.tr,
        confirmTextColor: Get.isDarkMode ? Colors.white : Colors.black,
        onCancel: () {
          Get.toNamed(AppRoutes.cartScreenRoute);
        },
        onConfirm: () {
          productMap.clear();
          Get.back();
        },
        buttonColor: Get.isDarkMode ? pinkClr : mainColor);
  }

  get productSubTotal =>
      productMap.entries.map((e) => e.key.price * e.value).toList();

  get total => productMap.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);

  int quantity() {
    if (productMap.isEmpty) {
      return 0;
    }
    return productMap.entries
        .map((e) => e.value)
        .toList()
        .reduce((value, element) => value + element);
  }
}
