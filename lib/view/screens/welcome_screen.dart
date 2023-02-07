import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shooping_app/controller/settings_controller.dart';
import '../../routes/app_routes.dart';
import '../../utils/my_string.dart';
import '../../utils/theme.dart';
import '../widget/text_utils.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({Key? key}) : super(key: key);

  final settingsController = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black.withOpacity(0.3),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 35,
                ),
                Container(
                  height: 60,
                  width: 190,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                      child: TextUtils(
                    text: 'Welcome'.tr,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 35,
                    underLine: TextDecoration.none,
                  )),
                ),
                const SizedBox(
                  height: 25,
                ),
                GetBuilder<SettingsController>(builder: (_) {
                  return Container(
                      height: 60,
                      width: 250,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            settingsController.getLanguage() == ara
                                ? 'Shop'.tr
                                : 'Asroo'.tr,
                            style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: settingsController.getLanguage() == ara
                                    ? Colors.white
                                    : mainColor),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            settingsController.getLanguage() == ara
                                ? 'Asroo'.tr
                                : 'Shop'.tr,
                            style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: settingsController.getLanguage() == ara
                                    ? mainColor
                                    : Colors.white),
                          ),
                        ],
                      ));
                }),
                const SizedBox(
                  height: 250,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.red,
                        backgroundColor: mainColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 12)),
                    onPressed: () {
                      Get.offAllNamed(AppRoutes.loginScreenRoute);
                    },
                    child: TextUtils(
                      text: 'Get Start'.tr,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 22,
                      underLine: TextDecoration.none,
                    )),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextUtils(
                      text: 'Do not have an Account?'.tr,
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      underLine: TextDecoration.none,
                    ),
                    TextButton(
                        onPressed: () {
                          Get.offNamed(AppRoutes.signUpScreenRoute);
                        },
                        child: TextUtils(
                          text: 'Sign Up'.tr,
                          fontWeight: FontWeight.normal,
                          fontSize: 18,
                          color: Colors.white,
                          underLine: TextDecoration.underline,
                        ))
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
