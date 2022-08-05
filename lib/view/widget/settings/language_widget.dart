import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shooping_app/controller/settings_controller.dart';

import '../../../utils/my_string.dart';
import '../../../utils/theme.dart';
import '../text_utils.dart';

class LanguageWidget extends StatelessWidget {
  LanguageWidget({Key? key}) : super(key: key);
  final settingsController = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(builder: (_) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildIconWidget(),
          Container(
            width: 120,
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                border: Border.all(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    width: 2)),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: settingsController.getLanguage(),
                iconSize: 25,
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                onChanged: (value) {
                  settingsController.changeLanguage(value!);
                },
                items: [
                  DropdownMenuItem(
                    value: ene,
                    child: Text(
                      english.tr,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  DropdownMenuItem(
                    value: ara,
                    child: Text(
                      arabic.tr,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  DropdownMenuItem(
                    value: fra,
                    child: Text(
                      france.tr,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      );
    });
  }

  Widget buildIconWidget() {
    return Material(
      color: Colors.transparent,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: darkSettings),
            child: const Icon(
              Icons.language,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          TextUtils(
              fontSize: 22,
              color: Get.isDarkMode ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
              underLine: TextDecoration.none,
              text: 'Language'.tr)
        ],
      ),
    );
  }
}
