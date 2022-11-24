import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ushop_app/utils/theme.dart';
import 'package:ushop_app/view/screens/auth/login_screen.dart';
import 'package:ushop_app/view/widgets/text_utils.dart';

import '../../routes/routes.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(
            'assets/images/background.png',
            fit: BoxFit.cover,
          ),
        ),
        Container(
            color: Colors.black.withOpacity(0.2),
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 60,
                  width: 190,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                      child: TextUtils(
                    underLine: TextDecoration.none,
                    text: 'welcome',
                    fontsize: 35,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  )),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 60,
                  width: 230,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextUtils(
                          underLine: TextDecoration.none,
                          text: 'Asro',
                          fontsize: 35,
                          fontWeight: FontWeight.bold,
                          color: mainColor),
                      const SizedBox(
                        width: 7,
                      ),
                      TextUtils(
                          underLine: TextDecoration.none,
                          text: 'shop',
                          fontsize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ],
                  ),
                ),
                SizedBox(
                  height: 250,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 12,
                      )),
                  onPressed: () {
                    Get.offNamed(Routes.loginScreen);
                  },
                  child: TextUtils(
                    underLine: TextDecoration.none,
                    fontsize: 22,
                    fontWeight: FontWeight.bold,
                    text: 'Get Started',
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextUtils(
                        text: 'Dont have and acount',
                        underLine: TextDecoration.none,
                        fontsize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.white),
                    TextButton(
                        onPressed: () {
                          Get.offNamed(Routes.signUpScreen);
                        },
                        child: TextUtils(
                          text: 'sign up',
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontsize: 18,
                          underLine: TextDecoration.underline,
                        ))
                  ],
                )
              ],
            )),
      ]),
    ));
  }
}
