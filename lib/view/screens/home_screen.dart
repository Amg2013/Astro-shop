import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shooping_app/config/themes/theme.dart';
import 'package:shooping_app/view/widget/home/search_form_text.dart';
import 'package:shooping_app/view/widget/text_utils.dart';

import '../widget/home/card_item.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Column(children: [
      Container(
        width: double.infinity,
        height: size.height * .26,
        padding: const EdgeInsets.only(left: 13, right: 10),
        decoration: BoxDecoration(
          color: Get.isDarkMode ? darkGreyClr : mainColor,
          borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextUtils(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                underLine: TextDecoration.none,
                text: 'Find Your'.tr),
            const SizedBox(
              height: 5,
            ),
            TextUtils(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                underLine: TextDecoration.none,
                text: 'INSPIRATION'.tr),
            const SizedBox(
              height: 20,
            ),
            SearchTextForm(),
          ],
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Container(
        padding: const EdgeInsets.only(left: 20.0),
        alignment: Alignment.topLeft,
        child: TextUtils(
            fontSize: 20,
            color: Get.isDarkMode ? Colors.white : Colors.black,
            fontWeight: FontWeight.w500,
            underLine: TextDecoration.none,
            text: 'Categories'.tr),
      ),
      const SizedBox(
        height: 30,
      ),
      CardItems()
    ]);
  }
}
