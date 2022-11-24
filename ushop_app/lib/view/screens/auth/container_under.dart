import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:ushop_app/utils/theme.dart';
import 'package:ushop_app/view/widgets/text_utils.dart';

class ContainerUnder extends StatelessWidget {
  final String text;
  final String texttype;
  final Function() onPressed;
  const ContainerUnder(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.texttype});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Get.isDarkMode ? mainColor : pinkClr,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            (20),
          ),
          topRight: Radius.circular(
            (20),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextUtils(
              text: text,
              fontsize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              underLine: TextDecoration.none),
          TextButton(
              onPressed: onPressed,
              child: TextUtils(
                  text: texttype,
                  fontsize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  underLine: TextDecoration.none))
        ],
      ),
    );
  }
}
