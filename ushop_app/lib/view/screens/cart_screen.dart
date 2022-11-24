import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:ushop_app/logic/controller/cart_controller.dart';
import 'package:ushop_app/utils/theme.dart';

import '../widgets/cart/cart_product_card.dart';
import '../widgets/cart/cart_total.dart';
import '../widgets/cart/empty_card.dart';

class CarScreen extends StatelessWidget {
  CarScreen({super.key});

  final controller = Get.find<CartController>();

  // final controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          title: Text('cart items'),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
          actions: [
            IconButton(
                onPressed: () {
                  controller.clearAllProducts();
                },
                icon: Icon(Icons.backspace))
          ],
        ),
        body: Obx(() {
          if (controller.productsMap.isEmpty) {
            return EmptyCard();
          } else {
            return SingleChildScrollView(
              child: Column(children: [
                SizedBox(
                  height: 600,
                  child: ListView.separated(
                      itemBuilder: ((context, index) {
                        return CartProductCard(
                          productModels:
                              controller.productsMap.keys.toList()[index],
                          index: index,
                          quantity:
                              controller.productsMap.values.toList()[index],
                        );
                      }),
                      separatorBuilder: ((context, index) => const SizedBox(
                            height: 20,
                          )),
                      itemCount: controller.productsMap.length),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: CartTotal(),
                ),
              ]),
            );
          }
        }),
      ),
    );
  }
}
