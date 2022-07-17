import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shooping_app/utils/theme.dart';

import '../widget/cart/empty_cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
        title: const Text('Cart Items'),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.backspace))],
      ),
      body: EmptyCart(),
    ));
  }
}
