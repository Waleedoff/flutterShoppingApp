import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ushop_app/logic/controller/auth_controller.dart';
import 'package:ushop_app/routes/routes.dart';
import 'package:ushop_app/utils/my_string.dart';
import 'package:ushop_app/utils/theme.dart';
import 'package:ushop_app/view/widgets/text_utils.dart';
import '../../widgets/auth_button.dart';
import 'auth_text_from_field.dart';
import 'check_widdget.dart';
import 'container_under.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final fromKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
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
                              text: 'SIGN',
                              fontsize: 28,
                              fontWeight: FontWeight.w500,
                              color: Get.isDarkMode ? mainColor : pinkClr,
                              underLine: TextDecoration.none),
                          SizedBox(
                            width: 3,
                          ),
                          TextUtils(
                              text: 'UP',
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
                      AuthTextFromField(
                        controller: nameController,
                        obscureText: false,
                        validator: (value) {
                          if (value.toString().length <= 2 ||
                              !RegExp(validationName).hasMatch(value)) {
                            return 'Enter Valid Name';
                          } else {
                            return null;
                          }
                        },
                        prefixIcon: Get.isDarkMode
                            ? Image.asset('assets/images/user.png')
                            : Icon(
                                Icons.person,
                                color: Colors.black,
                              ),
                        suffixIcon: const Text(''),
                        hintText: 'User Name ',
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
                      SizedBox(
                        height: 50,
                      ),
                      CheckWidget(),
                      SizedBox(
                        height: 50,
                      ),
                      GetBuilder<AuthController>(builder: (_) {
                        return AuthButton(
                          onPressed: () {
                            if (controller.isCheckBox == false) {
                              Get.snackbar(
                                'check Box',
                                'please, Accept terms  & conditions',
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.green,
                                colorText: Colors.white,
                              );
                            } else if (fromKey.currentState!.validate()) {
                              String name = nameController.text.trim();
                              String email = emailController.text.trim();
                              String password = passController.text;
                              controller.signUpUsingFirebase(
                                  name: name, email: email, password: password);
                              controller.isCheckBox = true;
                            }
                          },
                          text: 'SIGN UP',
                        );
                      })
                    ],
                  ),
                ),
              ),
            ),
            ContainerUnder(
              text: 'already have an account ? Log in ',
              texttype: 'Log in',
              onPressed: () {
                Get.offNamed(Routes.loginScreen);
              },
            ),
          ]),
        ),
      ),
    );
  }
}
