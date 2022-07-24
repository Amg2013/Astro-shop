import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shooping_app/controller/theme_controller.dart';
import 'package:shooping_app/routes/app_routes.dart';
import 'package:shooping_app/utils/my_string.dart';
import 'package:shooping_app/utils/theme.dart';
import 'package:shooping_app/view/widget/settings/language/loclization_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        locale: Locale(GetStorage().read<String>('lang').toString()),
        fallbackLocale: Locale(ene),
        translations: LocalizationApp(),
        theme: ThemesApp.light,
        darkTheme: ThemesApp.dark,
        themeMode: ThemeController().getThemeMode,
        initialRoute: AppRoutes.loginScreenRoute,
        getPages: AppRoutes.routes);
  }
}
