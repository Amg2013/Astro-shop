import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shooping_app/utils/theme.dart';
import 'package:shooping_app/view/widget/cart/cart_product.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 600,
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return CartProductCard();
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 20,
                    );
                  },
                  itemCount: 1),
            )
          ],
        ),
      ),
    ));
  }
}
