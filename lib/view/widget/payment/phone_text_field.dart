import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/theme.dart';

// ignore: must_be_immutable
class PhoneTextForm extends StatelessWidget {
  PhoneTextForm({Key? key, required this.phoneTextEditingController})
      : super(key: key);

  TextEditingController phoneTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: phoneTextEditingController,
      style: const TextStyle(color: Colors.black),
      cursorColor: Colors.black,
      keyboardType: TextInputType.number,
      maxLength: 11,
      onSubmitted: (value) {
        phoneTextEditingController.text = value;
      },
      decoration: InputDecoration(
          fillColor: Get.isDarkMode
              ? pinkClr.withOpacity(0.2)
              : mainColor.withOpacity(0.2),
          focusColor: Colors.red,
          prefixIcon: Icon(
            Icons.phone,
            color: Get.isDarkMode ? pinkClr : mainColor,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              phoneTextEditingController.clear();
            },
            icon: const Icon(
              Icons.close,
              color: Colors.black,
            ),
          ),
          hintText: 'Enter Your Phone Number'.tr,
          hintStyle: const TextStyle(
              color: Colors.black45, fontSize: 12, fontWeight: FontWeight.w500),
          filled: true,
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10)),
          errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10))),
    );
  }
}
