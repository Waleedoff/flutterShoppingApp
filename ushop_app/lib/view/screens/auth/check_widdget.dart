import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ushop_app/utils/theme.dart';
import 'package:ushop_app/view/widgets/text_utils.dart';

import '../../../logic/controller/auth_controller.dart';

class CheckWidget extends StatelessWidget {
  CheckWidget({super.key});

  final Controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_) {
      return Row(
        children: [
          InkWell(
            onTap: () {
              Controller.checkBox();
            },
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Controller.isCheckBox
                  ? Get.isDarkMode
                      ? Image.asset('assets/images/check.png')
                      : Icon(
                          Icons.done,
                          color: pinkClr,
                        )
                  : Container(),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Row(
            children: [
              TextUtils(
                  text: "I accept",
                  fontsize: 16,
                  fontWeight: FontWeight.normal,
                  color: Get.isDarkMode ? Colors.black : Colors.white,
                  underLine: TextDecoration.none),
              TextUtils(
                  text: "terms & conditions",
                  fontsize: 16,
                  fontWeight: FontWeight.normal,
                  color: Get.isDarkMode ? Colors.black : Colors.white,
                  underLine: TextDecoration.none),
            ],
          )
        ],
      );
    });
  }
}
