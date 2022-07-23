import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shooping_app/controller/cart_controller.dart';
import 'package:shooping_app/utils/theme.dart';
import 'package:shooping_app/view/widget/cart/cart_product.dart';
import 'package:shooping_app/view/widget/cart/empty_cart.dart';

import '../widget/cart/cart_total.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: context.theme.backgroundColor,
            appBar: AppBar(
              backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
              title: Text('Cart Items'.tr),
              centerTitle: true,
              actions: [
                IconButton(
                    onPressed: () {
                      cartController.clearAllProducts();
                    },
                    icon: Icon(Icons.backspace))
              ],
            ),
            body: Obx(() {
              if (cartController.productMap.isEmpty) {
                return EmptyCart();
              }
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 600,
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return CartProductCard(
                              index: index,
                              productModels: cartController.productMap.keys
                                  .toList()[index],
                              quantity: cartController.productMap.values
                                  .toList()[index],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 20,
                            );
                          },
                          itemCount: cartController.productMap.length),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: CartTotal(),
                    ),
                  ],
                ),
              );
            })));
  }
}
