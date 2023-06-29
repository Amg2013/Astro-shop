import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../text_utils.dart';
import '../../../config/themes/theme.dart';

class DownContainer extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final String textType;

  const DownContainer(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.textType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
          color: !Get.isDarkMode ? mainColor : pinkClr,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextUtils(
            text: text,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            underLine: TextDecoration.none,
            color: Colors.white,
          ),
          TextButton(
              onPressed: onPressed,
              child: TextUtils(
                text: textType,
                color: Colors.white,
                underLine: TextDecoration.underline,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ))
        ],
      ),
    );
  }
}
