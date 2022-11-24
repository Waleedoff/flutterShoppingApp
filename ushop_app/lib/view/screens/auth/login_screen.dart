import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:ushop_app/view/screens/auth/container_under.dart';
import 'package:ushop_app/view/screens/auth/forgot_password_screen.dart';

import '../../../logic/controller/auth_controller.dart';
import '../../../routes/routes.dart';
import '../../../utils/my_string.dart';
import '../../../utils/theme.dart';
import '../../widgets/auth_button.dart';
import '../../widgets/text_utils.dart';
import 'auth_text_from_field.dart';
import 'check_widdget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final fromKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 1.3,
              child: Padding(
                padding: EdgeInsets.only(left: 25, right: 25, top: 40),
                child: Form(
                  key: fromKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          TextUtils(
                              text: 'LOG',
                              fontsize: 28,
                              fontWeight: FontWeight.w500,
                              color: Get.isDarkMode ? mainColor : pinkClr,
                              underLine: TextDecoration.none),
                          SizedBox(
                            width: 3,
                          ),
                          TextUtils(
                              text: 'IN',
                              fontsize: 28,
                              fontWeight: FontWeight.w500,
                              color:
                                  Get.isDarkMode ? Colors.black : Colors.white,
                              underLine: TextDecoration.none),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AuthTextFromField(
                        controller: emailController,
                        obscureText: false,
                        validator: (value) {
                          if (!RegExp(validationEmail).hasMatch(value)) {
                            return 'invalid email';
                          } else {
                            return null;
                          }
                        },
                        prefixIcon: Get.isDarkMode
                            ? Image.asset('assets/images/email.png')
                            : Icon(
                                Icons.email,
                                color: pinkClr,
                                size: 30,
                              ),
                        suffixIcon: const Text(''),
                        hintText: 'Email ',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GetBuilder<AuthController>(builder: (_) {
                        return AuthTextFromField(
                          controller: passController,
                          obscureText: controller.isVisibility ? false : true,
                          validator: (value) {
                            if (value.toString().length < 6) {
                              return 'password should be longer or equal to & characters ';
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: Image.asset('assets/images/lock.png'),
                          suffixIcon: IconButton(
                            onPressed: () {
                              controller.visibillity();
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
                          hintText: 'Password ',
                        );
                      }),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {
                              Get.toNamed(Routes.forgotPasswordScreen);
                            },
                            child: TextUtils(
                              text: 'Forgoet Password? ',
                              fontsize: 14,
                              color:
                                  Get.isDarkMode ? Colors.black : Colors.white,
                              fontWeight: FontWeight.normal,
                              underLine: TextDecoration.none,
                            )),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      GetBuilder<AuthController>(builder: (_) {
                        return AuthButton(
                          onPressed: () {
                            if (fromKey.currentState!.validate()) {
                              String email = emailController.text.trim();
                              String password = passController.text;
                              controller.logInUsingFirebase(
                                  email: email, password: password);
                            }
                          },
                          text: 'LOG IN',
                        );
                      }),
                      const SizedBox(
                        height: 20,
                      ),
                      TextUtils(
                          text: 'OR',
                          fontsize: 18,
                          fontWeight: FontWeight.w500,
                          color: Get.isDarkMode ? Colors.black : Colors.white,
                          underLine: TextDecoration.none),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                              onTap: () {},
                              child: Image.asset('assets/images/facebook.png')),
                          SizedBox(
                            width: 10,
                          ),
                          GetBuilder<AuthController>(builder: (_) {
                            return InkWell(
                                onTap: () {
                                  controller.googleSignUpApp();
                                },
                                child: Image.asset('assets/images/google.png'));
                          })
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ContainerUnder(
              text: "Don't have an account ? Log in ",
              texttype: 'sign up',
              onPressed: () {
                Get.offNamed(Routes.signUpScreen);
              },
            ),
          ]),
        ),
      ),
    );
  }
}
