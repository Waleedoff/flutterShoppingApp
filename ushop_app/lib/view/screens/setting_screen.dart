import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ushop_app/utils/theme.dart';
import 'package:ushop_app/view/widgets/text_utils.dart';

import '../widgets/setting/dark_mode_widget.dart';
import '../widgets/setting/language_widget.dart';
import '../widgets/setting/logout_widget.dart';
import '../widgets/setting/profile_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,

      body: ListView(
        padding: EdgeInsets.all(24),
        children: [
          ProfileWidget(),
          const SizedBox(
            height: 10,
          ),
          Divider(
            color: Get.isDarkMode ? Colors.white : Colors.grey,
            thickness: 2,
          ),
          SizedBox(
            height: 20,
          ),
          TextUtils(
              text: 'GENERAL',
              fontsize: 18,
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? pinkClr : mainColor,
              underLine: TextDecoration.none),
          SizedBox(
            height: 20,
          ),
          DarkModeWidget(),
          SizedBox(
            height: 20,
          ),
          LanguageWidget(),
          SizedBox(
            height: 20,
          ),
          LogOutWidget(),
        ],
      ),

      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       TextButton(
      //         onPressed: () {
      //           ThemeController().changesTheme();
      //         },
      //         child: Text(
      //           'Dark Mode',
      //           style: TextStyle(
      //               color: Get.isDarkMode ? Colors.white : Colors.black),
      //         ),
      //       ),
      //       SizedBox(
      //         height: 20,
      //       ),
      //       GetBuilder<AuthController>(
      //         builder: (controller) {
      //           return TextButton(
      //             onPressed: () {
      //               // controller.signOutFromApp();
      //               Get.defaultDialog(
      //                   title: 'LogOut from App',
      //                   titleStyle: TextStyle(
      //                     fontSize: 18,
      //                     color: Colors.black,
      //                     fontWeight: FontWeight.bold,
      //                   ),
      //                   middleText: 'Are your sure you need to logOut',
      //                   middleTextStyle: TextStyle(
      //                     fontSize: 18,
      //                     color: Colors.black,
      //                     fontWeight: FontWeight.bold,
      //                   ),
      //                   backgroundColor: Colors.grey,
      //                   radius: 10,
      //                   textCancel: 'No',
      //                   cancelTextColor: Colors.white,
      //                   textConfirm: 'Yes',
      //                   confirmTextColor: Colors.white,
      //                   onCancel: () {
      //                     Get.back();
      //                   },
      //                   onConfirm: () {
      //                     controller.signOutFromApp();
      //                   },
      //                   buttonColor: Get.isDarkMode ? pinkClr : mainColor);
      //             },
      //             child: Text(
      //               'LogOut',
      //               style: TextStyle(
      //                   color: Get.isDarkMode ? Colors.white : Colors.black),
      //             ),
      //           );
      //         },
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
