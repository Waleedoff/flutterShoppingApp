import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:ushop_app/routes/routes.dart';
import 'package:ushop_app/utils/theme.dart';

class EmptyCard extends StatelessWidget {
  const EmptyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart,
            size: 150,
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
          SizedBox(
            height: 40,
          ),
          RichText(
              text: TextSpan(children: [
            TextSpan(
              text: 'your cart is ',
              style: TextStyle(
                color: Get.isDarkMode ? Colors.white : Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: 'Empty  ',
              style: TextStyle(
                color: Get.isDarkMode ? pinkClr : mainColor,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            )
          ])),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Add items to get started',
            style: TextStyle(
              color: Get.isDarkMode ? pinkClr : mainColor,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          SizedBox(
              height: 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 0,
                    primary: Get.isDarkMode ? pinkClr : mainColor,
                  ),
                  onPressed: () {
                    Get.toNamed(Routes.mainScreen);
                  },
                  child: const Text(
                    'Go To Home',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ))),
        ],
      ),
    );
  }
}
