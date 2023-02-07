import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../utils/my_string.dart';

class SettingsController extends GetxController {
  var switchValue = false.obs;
  var storage = GetStorage();
  var localLang = ene;

  String capitalize(String profileName) {
    return profileName.split(' ').map((name) => name.capitalize).join(' ');
  }

  @override
  void onInit() {
    super.onInit();
    localLang = getLanguage();
  }

  //language

  void changeLanguage(String languageType) {
    if (localLang == languageType) {
      return;
    }
    localLang = languageType;
    saveLanguage(localLang);
    Get.updateLocale(Locale(localLang));
    update();
  }

  String getLanguage() {
    return storage.read('lang') ?? ene;
  }

  void saveLanguage(String lang) async {
    await storage.write('lang', lang);
  }
}
