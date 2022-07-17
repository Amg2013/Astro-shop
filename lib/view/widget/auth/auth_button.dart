import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shooping_app/view/widget/text_utils.dart';

import '../../../utils/theme.dart';

class AuthButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;

  const AuthButton({Key? key, required this.onPressed, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          primary: !Get.isDarkMode ? mainColor : pinkClr,
          minimumSize: const Size(320, 40),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
      child: TextUtils(
        text: text,
        color: Colors.white,
        underLine: TextDecoration.none,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
