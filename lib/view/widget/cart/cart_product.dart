import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/cart_controller.dart';
import '../../../model/product_models.dart';
import '../../../config/themes/theme.dart';

class CartProductCard extends StatelessWidget {
  CartProductCard(
      {Key? key,
      required this.productModels,
      required this.index,
      required this.quantity})
      : super(key: key);

  final int index;
  final ProductModels productModels;
  final cartController = Get.find<CartController>();
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
      height: 130,
      width: 100,
      decoration: BoxDecoration(
          color: Get.isDarkMode
              ? pinkClr.withOpacity(0.7)
              : mainColor.withOpacity(0.4),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 15),
            height: 120,
            width: 100,
            decoration: BoxDecoration(
                color: CupertinoColors.white,
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: NetworkImage('${productModels.image}'),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${productModels.title}',
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Get.isDarkMode ? Colors.white : Colors.black),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  '\$ ${cartController.productSubTotal[index].toStringAsFixed(2)}',
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Get.isDarkMode ? Colors.white : Colors.black),
                )
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        cartController.removeProductFromCart(productModels);
                      },
                      icon: Icon(Icons.remove_circle,
                          color: Get.isDarkMode ? Colors.white : Colors.black)),
                  Text(
                    '$quantity',
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Get.isDarkMode ? Colors.white : Colors.black),
                  ),
                  IconButton(
                      onPressed: () {
                        cartController.addProductToCart(productModels);
                      },
                      icon: Icon(
                        Icons.add_circle,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                      )),
                ],
              ),
              IconButton(
                  onPressed: () {
                    cartController.removeOneProduct(productModels);
                  },
                  icon: Icon(Icons.delete,
                      size: 30,
                      color: Get.isDarkMode ? Colors.black : Colors.red)),
            ],
          )
        ],
      ),
    );
  }
}
