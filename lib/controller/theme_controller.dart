import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController {
  final GetStorage boxStorage = GetStorage();
  final key = 'isDarkMode';

  void saveThemeDataInBoxStorage(bool isDark) {
    boxStorage.write(key, isDark);
  }

  bool getThemeDataFromBoxStorage() {
    return boxStorage.read<bool>(key) ?? false;
  }

  ThemeMode get getThemeMode =>
      getThemeDataFromBoxStorage() ? ThemeMode.dark : ThemeMode.light;

  void changeTheme() {
    Get.changeThemeMode(
        getThemeDataFromBoxStorage() ? ThemeMode.light : ThemeMode.dark);
    saveThemeDataInBoxStorage(!getThemeDataFromBoxStorage());
  }
}
