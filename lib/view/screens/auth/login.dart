import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shooping_app/controller/auth_controller.dart';
import 'package:shooping_app/routes/app_routes.dart';
import 'package:shooping_app/utils/my_string.dart';

import '../../../utils/theme.dart';
import '../../widget/auth/auth_button.dart';
import '../../widget/auth/auth_text_field.dart';
import '../../widget/auth/down_container.dart';
import '../../widget/text_utils.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: context.theme.backgroundColor,
          appBar: AppBar(
            backgroundColor: !Get.isDarkMode ? Colors.white : darkGreyClr,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                  text: 'LOG',
                                  fontSize: 35,
                                  color: !Get.isDarkMode ? mainColor : pinkClr,
                                  fontWeight: FontWeight.w500,
                                  underLine: TextDecoration.none),
                              const SizedBox(
                                width: 10,
                              ),
                              TextUtils(
                                  text: 'IN',
                                  fontSize: 35,
                                  color: !Get.isDarkMode
                                      ? Colors.black
                                      : Colors.white,
                                  fontWeight: FontWeight.w500,
                                  underLine: TextDecoration.none),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          AuthTextFormField(
                            controller: emailController,
                            validator: (value) {
                              if (!RegExp(validationEmail)
                                  .hasMatch(value ?? '')) {
                                return 'Invalid Email';
                              }
                              return null;
                            },
                            obscureText: false,
                            hintText: 'Email',
                            prefixIcon: !Get.isDarkMode
                                ? Image.asset('assets/images/email.png')
                                : Icon(
                                    Icons.email,
                                    color: pinkClr,
                                    size: 30,
                                  ),
                            suffixIcon: Text(''),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          GetBuilder<AuthController>(builder: (_) {
                            return AuthTextFormField(
                              controller: passwordController,
                              validator: (value) {
                                if (value.toString().length < 6) {
                                  return 'write a strong password';
                                }
                                return null;
                              },
                              obscureText:
                              controller.isVisibility ? false : true,
                              hintText: 'Password',
                              prefixIcon: !Get.isDarkMode
                                  ? Image.asset('assets/images/lock.png')
                                  : Icon(
                                      Icons.lock,
                                      color: pinkClr,
                                      size: 30,
                                    ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  controller.visibility();
                                },
                                icon: controller.isVisibility
                                    ? Icon(
                                  Icons.visibility,
                                  color: Colors.black,
                                )
                                    : Icon(
                                  Icons.visibility_off,
                                  color: Colors.black,
                                ),
                              ),
                            );
                          }),
                          SizedBox(
                            height: 12,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(
                                    AppRoutes.forgetPasswordScreenRoute);
                              },
                              child: TextUtils(
                                  text: 'Forget password?',
                                  fontSize: 18,
                                  color: !Get.isDarkMode
                                      ? Colors.black
                                      : Colors.white,
                                  fontWeight: FontWeight.w500,
                                  underLine: TextDecoration.none),
                            ),
                          ),
                          SizedBox(
                            height: 80,
                          ),
                          GetBuilder<AuthController>(
                            builder: (_) {
                              return AuthButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate() ==
                                      true) {
                                    String email = emailController.text.trim();
                                    String password = passwordController.text;
                                    controller.loginUsingFirebase(
                                        email: email, password: password);
                                  }
                                },
                                text: 'LOG IN',
                              );
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextUtils(
                              fontSize: 20,
                              color:
                                  !Get.isDarkMode ? Colors.black : Colors.white,
                              fontWeight: FontWeight.bold,
                              underLine: TextDecoration.none,
                              text: 'OR'),
                          SizedBox(
                            height: 13,
                          ),
                          GetBuilder<AuthController>(builder: (_) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                    onTap: () {},
                                    child: Image.asset(
                                        'assets/images/facebook.png')),
                                InkWell(
                                    onTap: () {
                                      controller.googleSignUp();
                                    },
                                    child: Image.asset(
                                        'assets/images/google.png')),
                              ],
                            );
                          })
                        ],
                      ),
                    ),
                  ),
                ),
                DownContainer(
                    text: 'Don`t have an Account? ',
                    onPressed: () {
                      Get.offNamed(AppRoutes.signUpScreenRoute);
                    },
                    textType: 'Sign up')
              ],
            ),
          )),
    );
  }
}
