import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shooping_app/routes/app_routes.dart';
import 'package:shooping_app/utils/theme.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart,
            size: 150,
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
          SizedBox(
            height: 40,
          ),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: 'Your Cart is '.tr,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? Colors.white : Colors.black)),
            TextSpan(
                text: 'Empty'.tr,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? pinkClr : mainColor))
          ])),
          const SizedBox(
            height: 10,
          ),
          Text('Add items to get started'.tr,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? Colors.white : Colors.black)),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    elevation: 0,
                    primary: Get.isDarkMode ? pinkClr : mainColor),
                onPressed: () {
                  Get.toNamed(AppRoutes.mainScreenRoute);
                },
                child: Text('Go to Home'.tr,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Get.isDarkMode ? Colors.white : Colors.black))),
          )
        ],
      ),
    );
  }
}
