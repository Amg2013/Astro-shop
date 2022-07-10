import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';
import '../../utils/theme.dart';
import '../widget/text_utils.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

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
                SizedBox(
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
                    text: 'Welcome',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 35,
                    underLine: TextDecoration.none,
                  )),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                    height: 60,
                    width: 230,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextUtils(
                          text: 'Asroo',
                          fontWeight: FontWeight.bold,
                          color: mainColor,
                          fontSize: 35,
                          underLine: TextDecoration.none,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        TextUtils(
                          text: 'Shop',
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 35,
                          underLine: TextDecoration.none,
                        ),
                      ],
                    )),
                SizedBox(
                  height: 250,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: mainColor,
                        onPrimary: Colors.red,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 12)),
                    onPressed: () {
                      Get.offAllNamed(AppRoutes.loginScreenRoute);
                    },
                    child: TextUtils(
                      text: 'Get Start',
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
                      text: 'Do not have an Account?',
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
                          text: 'Sign Up',
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
