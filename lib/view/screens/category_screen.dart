import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shooping_app/view/widget/text_utils.dart';
import '../widget/category/categor_widget.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 15, top: 15),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 15, left: 15),
                child: TextUtils(
                  text: 'Category'.tr,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  underLine: TextDecoration.none,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CategoryWidget(),
          ],
        ),
      ),
    );
  }
}
