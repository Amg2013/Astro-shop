import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shooping_app/view/widget/settings/profile_widget.dart';
import 'package:shooping_app/view/widget/text_utils.dart';

import '../../utils/theme.dart';
import '../widget/settings/dark_modeWidget.dart';
import '../widget/settings/language_widget.dart';
import '../widget/settings/logout_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.theme.colorScheme.background,
        body: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            ProfileImage(),
            const SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 2,
              color: Get.isDarkMode ? Colors.white : Colors.grey,
            ),
            const SizedBox(
              height: 20,
            ),
            TextUtils(
                fontSize: 18,
                color: Get.isDarkMode ? pinkClr : mainColor,
                fontWeight: FontWeight.bold,
                underLine: TextDecoration.none,
                text: 'GENERAL'.tr),
            const SizedBox(
              height: 20,
            ),
            DarkModeWidget(),
            const SizedBox(
              height: 20,
            ),
            LanguageWidget(),
            const SizedBox(
              height: 20,
            ),
            LogOutWidget(),
          ],
        ));
  }
}