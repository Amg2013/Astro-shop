import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shooping_app/controller/auth_controller.dart';
import 'package:shooping_app/routes/app_routes.dart';
import 'package:shooping_app/utils/my_string.dart';

import '../../../utils/theme.dart';
import '../../widget/auth_button.dart';
import '../../widget/auth_text_field.dart';
import '../../widget/check_widget.dart';
import '../../widget/down_container.dart';
import '../../widget/text_utils.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
            elevation: 0,
          ),
          backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
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
                                  text: 'SIGN',
                                  fontSize: 35,
                                  color: Get.isDarkMode ? mainColor : pinkClr,
                                  fontWeight: FontWeight.w500,
                                  underLine: TextDecoration.none),
                              SizedBox(
                                width: 10,
                              ),
                              TextUtils(
                                  text: 'UP',
                                  fontSize: 35,
                                  color: Get.isDarkMode
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
                            controller: userNameController,
                            validator: (value) {
                              if (!RegExp(validationName)
                                  .hasMatch(value ?? '')) {
                                return 'Invalid name';
                              }
                              return null;
                            },
                            obscureText: false,
                            hintText: 'User Name',
                            prefixIcon: Get.isDarkMode
                                ? Image.asset('assets/images/user.png')
                                : Icon(
                                    Icons.person,
                                    color: pinkClr,
                                    size: 30,
                                  ),
                            suffixIcon: Text(''),
                          ),
                          SizedBox(
                            height: 20,
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
                            prefixIcon: Get.isDarkMode
                                ? Image.asset('assets/images/email.png')
                                : Icon(
                                    Icons.email,
                                    color: pinkClr,
                                    size: 30,
                                  ),
                            suffixIcon: Text(''),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GetBuilder<AuthController>(builder: (controller) {
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
                              prefixIcon: Get.isDarkMode
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
                            height: 50,
                          ),
                          Expanded(child: CheckWidget()),
                          SizedBox(
                            height: 50,
                          ),
                          Expanded(
                            child: AuthButton(
                              onPressed: () {},
                              text: 'SIGN UP',
                            ),
                          ),
                          SizedBox(
                            height: 55,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                DownContainer(
                    text: 'Already have an account?',
                    onPressed: () {
                      Get.offNamed(AppRoutes.loginScreenRoute);
                    },
                    textType: 'Login')
              ],
            ),
          )),
    );
  }
}
