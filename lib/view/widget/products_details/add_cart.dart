import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shooping_app/controller/cart_controller.dart';
import 'package:shooping_app/model/product_models.dart';
import 'package:shooping_app/view/widget/text_utils.dart';
import '../../../config/themes/theme.dart';

class AddCart extends StatelessWidget {
  AddCart({Key? key, required this.price, required this.productModels})
      : super(key: key);

  final double price;
  final ProductModels productModels;
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUtils(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  underLine: TextDecoration.none,
                  text: 'Price'),
              Text(
                '\$ $price',
                style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    height: 1.5),
              )
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Container(
              height: 60,
              margin: EdgeInsets.only(right: 10),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
                      elevation: 0),
                  onPressed: () {
                    cartController.addProductToCart(productModels);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Add To Cart',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.shopping_cart)
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
