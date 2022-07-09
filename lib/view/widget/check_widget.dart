import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shooping_app/view/widget/text_utils.dart';

import '../../utils/theme.dart';

class CheckWidget extends StatelessWidget {
  const CheckWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade200),
            child: Get.isDarkMode
                ? Image.asset('assets/images/check.png')
                : Icon(
                    Icons.done,
                    color: pinkClr,
                    size: 30,
                  ),
          ),
        ),
        const SizedBox(
          width: 13,
        ),
        TextUtils(
            text: 'I accept ',
            fontSize: 18,
            color: Get.isDarkMode ? Colors.black : Colors.white,
            fontWeight: FontWeight.normal,
            underLine: TextDecoration.none),
        TextUtils(
            text: 'terms & conditions',
            fontSize: 18,
            color: Get.isDarkMode ? Colors.black : Colors.white,
            fontWeight: FontWeight.normal,
            underLine: TextDecoration.underline),
      ],
    );
  }
}
