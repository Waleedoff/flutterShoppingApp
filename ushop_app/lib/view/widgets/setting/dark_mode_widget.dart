import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:ushop_app/logic/controller/setting_controller.dart';
import 'package:ushop_app/logic/controller/theme_controller.dart';
import 'package:ushop_app/utils/theme.dart';
import 'package:ushop_app/view/widgets/text_utils.dart';

class DarkModeWidget extends StatelessWidget {
  DarkModeWidget({super.key});
  final controller = Get.find<SettingController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildIconWidget(),
            Switch(
              activeTrackColor: Get.isDarkMode ? pinkClr : mainColor,
              activeColor: Get.isDarkMode ? pinkClr : mainColor,
              value: controller.swithchValue.value,
              onChanged: (value) {
                ThemeController().changesTheme();
                controller.swithchValue.value = value;
              },
            ),
          ],
        ));
  }

  Widget buildIconWidget() {
    return Material(
      color: Colors.transparent,
      child: Row(children: [
        Container(
          padding: EdgeInsets.all(7),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: darkSettings,
          ),
          child: Icon(
            Icons.dark_mode,
            color: Colors.white,
          ),
        ),
        SizedBox(
          width: 20,
        ),
        TextUtils(
            text: 'Dark Mode',
            fontsize: 22,
            fontWeight: FontWeight.bold,
            color: Get.isDarkMode ? Colors.white : Colors.black,
            underLine: TextDecoration.none)
      ]),
    );
  }
}
