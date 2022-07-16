import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shooping_app/controller/auth_controller.dart';
import 'package:shooping_app/controller/theme_controller.dart';

import '../../utils/theme.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  ThemeController().changeTheme();
                },
                child: Text(
                  'Dark Mode',
                  style: TextStyle(
                    color: Get.isDarkMode == true ? Colors.white : Colors.black,
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            GetBuilder<AuthController>(builder: (controller) {
              return TextButton(
                  onPressed: () {
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
                        cancelTextColor:
                            Get.isDarkMode ? Colors.white : Colors.black,
                        textConfirm: 'Yes',
                        confirmTextColor:
                            Get.isDarkMode ? Colors.white : Colors.black,
                        onCancel: () {
                          Get.back();
                        },
                        onConfirm: () {
                          controller.signOutFromApp();
                        },
                        buttonColor: Get.isDarkMode ? pinkClr : mainColor);
                  },
                  child: Text(
                    'Log Out',
                    style: TextStyle(
                        color: Get.isDarkMode ? Colors.white : Colors.black),
                  ));
            })
          ],
        ),
      ),
    );
  }
}
