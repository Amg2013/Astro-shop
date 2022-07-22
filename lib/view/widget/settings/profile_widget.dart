import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shooping_app/controller/settings_controller.dart';
import 'package:shooping_app/view/widget/text_utils.dart';

import '../../../controller/auth_controller.dart';

class ProfileImage extends StatelessWidget {
  ProfileImage({Key? key}) : super(key: key);

  final settingsController = Get.find<SettingsController>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(
                          authController.displayUserPhoto.value ?? ''),
                      fit: BoxFit.cover)),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtils(
                    fontSize: 22,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                    underLine: TextDecoration.none,
                    text: settingsController
                        .capitalize(authController.displayUserName.value)),
                TextUtils(
                    fontSize: 14,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                    underLine: TextDecoration.none,
                    text: authController.displayUserEmail.value),
              ],
            )
          ],
        )
      ],
    );
  }
}
