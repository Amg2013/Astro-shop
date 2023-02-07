import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shooping_app/controller/auth_controller.dart';
import 'package:shooping_app/utils/theme.dart';
import 'package:shooping_app/view/widget/auth/auth_button.dart';

import '../../../utils/my_string.dart';
import '../../widget/auth/auth_text_field.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.colorScheme.background,
        appBar: AppBar(
          backgroundColor: !Get.isDarkMode ? Colors.white : darkGreyClr,
          elevation: 0,
          title: Text(
            'Forget password'.tr,
            style: TextStyle(
                color: !Get.isDarkMode ? mainColor : pinkClr,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                color: !Get.isDarkMode ? Colors.black : Colors.white,
              )),
        ),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.close_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    'If you want to recover your account, then please provide your email ID blew..'
                        .tr,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: !Get.isDarkMode ? Colors.black : Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Image.asset(
                    'assets/images/forgetpass copy.png',
                    width: 300,
                    height: 300,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AuthTextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (!RegExp(validationEmail).hasMatch(value ?? '')) {
                        return 'Invalid Email'.tr;
                      }
                      return null;
                    },
                    obscureText: false,
                    hintText: 'Email'.tr,
                    prefixIcon: !Get.isDarkMode
                        ? Image.asset('assets/images/email.png')
                        : const Icon(
                            Icons.email,
                            color: pinkClr,
                            size: 30,
                          ),
                    suffixIcon: const Text(''),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  GetBuilder<AuthController>(builder: (_) {
                    return AuthButton(
                        onPressed: () {
                          if (formKey.currentState!.validate() == true) {
                            String email = emailController.text.trim();
                            controller.resetPassword(email);
                          }
                        },
                        text: 'SEND'.tr);
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
