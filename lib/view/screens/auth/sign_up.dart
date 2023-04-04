import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shooping_app/controller/auth_controller.dart';
import 'package:shooping_app/routes/app_routes.dart';
import 'package:shooping_app/config/utils/my_string.dart';

import '../../../config/themes/theme.dart';
import '../../widget/auth/auth_button.dart';
import '../../widget/auth/auth_text_field.dart';
import '../../widget/auth/check_widget.dart';
import '../../widget/auth/down_container.dart';
import '../../widget/text_utils.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 1.3,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 25, right: 25, top: 0, bottom: 0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              TextUtils(
                                  text: 'SIGN'.tr,
                                  fontSize: 35,
                                  color: !Get.isDarkMode ? mainColor : pinkClr,
                                  fontWeight: FontWeight.w500,
                                  underLine: TextDecoration.none),
                              const SizedBox(
                                width: 10,
                              ),
                              TextUtils(
                                  text: 'UP'.tr,
                                  fontSize: 35,
                                  color: !Get.isDarkMode
                                      ? Colors.black
                                      : Colors.white,
                                  fontWeight: FontWeight.w500,
                                  underLine: TextDecoration.none),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          AuthTextFormField(
                            controller: userNameController,
                            validator: (value) {
                              if (!RegExp(validationName)
                                  .hasMatch(value ?? '')) {
                                return 'Invalid name'.tr;
                              }
                              return null;
                            },
                            obscureText: false,
                            hintText: 'User Name'.tr,
                            prefixIcon: !Get.isDarkMode
                                ? Image.asset('assets/images/user.png')
                                : const Icon(
                                    Icons.person,
                                    color: pinkClr,
                                    size: 30,
                                  ),
                            suffixIcon: Text(''),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          AuthTextFormField(
                              controller: emailController,
                              validator: (value) {
                                if (!RegExp(validationEmail)
                                    .hasMatch(value ?? '')) {
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
                              suffixIcon: Text('')),
                          const SizedBox(height: 15),
                          GetBuilder<AuthController>(builder: (controller) {
                            return AuthTextFormField(
                              controller: passwordController,
                              validator: (value) {
                                if (value.toString().length < 6) {
                                  return 'write a strong password'.tr;
                                }
                                return null;
                              },
                              obscureText:
                                  controller.isVisibility ? false : true,
                              hintText: 'Password'.tr,
                              prefixIcon: !Get.isDarkMode
                                  ? Image.asset('assets/images/lock.png')
                                  : const Icon(
                                      Icons.lock,
                                      color: pinkClr,
                                      size: 30,
                                    ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  controller.visibility();
                                },
                                icon: controller.isVisibility
                                    ? const Icon(
                                        Icons.visibility,
                                        color: Colors.black,
                                      )
                                    : const Icon(
                                        Icons.visibility_off,
                                        color: Colors.black,
                                      ),
                              ),
                            );
                          }),
                          const SizedBox(height: 15),
                          CheckWidget(),
                          const SizedBox(height: 20),
                          GetBuilder<AuthController>(
                            builder: (_) {
                              return AuthButton(
                                onPressed: () {
                                  if (controller.isCheckBox == false) {
                                    Get.snackbar('Check box'.tr,
                                        'Please, Accept terms & conditions'.tr,
                                        backgroundColor: Colors.green,
                                        colorText: Colors.white,
                                        snackPosition: SnackPosition.BOTTOM);
                                  } else if (formKey.currentState!.validate()) {
                                    String name =
                                        userNameController.text.trim();
                                    String email = emailController.text.trim();
                                    String password = passwordController.text;
                                    controller.signUpUsingFirebase(
                                        name: name,
                                        password: password,
                                        email: email);
                                  }
                                },
                                text: 'SIGN UP'.tr,
                              );
                            },
                          ),
                          const SizedBox(
                            height: 50,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                DownContainer(
                    text: 'Already have an account?'.tr,
                    onPressed: () {
                      Get.offNamed(AppRoutes.loginScreenRoute);
                    },
                    textType: 'Login'.tr)
              ],
            ),
          )),
    );
  }
}
