import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shooping_app/controller/cart_controller.dart';
import 'package:shooping_app/routes/app_routes.dart';
import 'package:shooping_app/config/themes/theme.dart';
import 'package:shooping_app/view/widget/text_utils.dart';

class CartTotal extends StatelessWidget {
  CartTotal({Key? key}) : super(key: key);
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 13),
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
                  text: 'Total'.tr),
              Text(
                '\$ ${cartController.total}',
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
              margin: const EdgeInsets.only(right: 10),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
                      elevation: 0),
                  onPressed: () {},
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes.paymentScreenRoute);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Check Out'.tr,
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.shopping_cart)
                      ],
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
