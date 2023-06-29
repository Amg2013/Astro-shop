import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/auth_controller.dart';

import '../../../utils/theme.dart';
import '../text_utils.dart';

class LogOutWidget extends StatelessWidget {
  LogOutWidget({Key? key}) : super(key: key);
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_) {
      return InkWell(
        onTap: () {
          Get.defaultDialog(
              title: "Log Out From App",
              titleStyle: TextStyle(
                color: Get.isDarkMode ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              middleText: 'Are you sure to log out?',
              middleTextStyle: TextStyle(
                color: Get.isDarkMode ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              radius: 10,
              textCancel: 'No',
              cancelTextColor: Get.isDarkMode ? Colors.white : Colors.black,
              textConfirm: 'Yes',
              confirmTextColor: Get.isDarkMode ? Colors.white : Colors.black,
              onCancel: () {
                Get.back();
              },
              onConfirm: () {
                authController.signOutFromApp();
              },
              buttonColor: Get.isDarkMode ? pinkClr : mainColor);
        },
        splashColor: Get.isDarkMode
            ? pinkClr.withOpacity(0.4)
            : mainColor.withOpacity(0.4),
        child: Material(
          color: Colors.transparent,
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: logOutSettings),
                child: const Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              TextUtils(
                  fontSize: 22,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                  underLine: TextDecoration.none,
                  text: 'Logout'.tr)
            ],
          ),
        ),
      );
    });
  }
}
