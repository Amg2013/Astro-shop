import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shooping_app/controller/auth_controller.dart';
import 'package:shooping_app/view/widget/text_utils.dart';

import '../../../utils/theme.dart';

class CheckWidget extends StatelessWidget {
  CheckWidget({Key? key}) : super(key: key);
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_) {
      return Row(
        children: [
          InkWell(
              onTap: () {
                controller.checkBox();
              },
              child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade200),
                  child: controller.isCheckBox
                      ? !Get.isDarkMode
                          ? Image.asset('assets/images/check.png')
                          : Icon(Icons.done, size: 30, color: pinkClr)
                      : Container())),
          const SizedBox(
            width: 13,
          ),
          TextUtils(
              text: 'I accept ',
              fontSize: 18,
              color: !Get.isDarkMode ? Colors.black : Colors.white,
              fontWeight: FontWeight.normal,
              underLine: TextDecoration.none),
          TextUtils(
              text: 'terms & conditions',
              fontSize: 18,
              color: !Get.isDarkMode ? Colors.black : Colors.white,
              fontWeight: FontWeight.normal,
              underLine: TextDecoration.underline),
        ],
      );
    });
  }
}
