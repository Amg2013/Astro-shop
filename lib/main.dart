import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'routes/app_routes.dart';
import 'view/widget/settings/language/loclization_app.dart';

import 'config/themes/theme.dart';
import 'config/utils/my_string.dart';
import 'controller/theme_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // ignore: deprecated_member_use
  FlutterNativeSplash.removeAfter(initialization);
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(const MyApp());
}

Future initialization(BuildContext? context) async {
  await Future.delayed(Duration(seconds: 1));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Assro Shop',
        debugShowCheckedModeBanner: false,
        locale: Locale(GetStorage().read<String>('lang').toString()),
        fallbackLocale: Locale(ene),
        translations: LocalizationApp(),
        theme: ThemesApp.light,
        darkTheme: ThemesApp.dark,
        themeMode: ThemeController().getThemeMode,
        initialRoute: GetStorage().read('isSignUp') == true
            ? AppRoutes.mainScreenRoute
            : AppRoutes.welcomeRoute,
        getPages: AppRoutes.routes);
  }
}
