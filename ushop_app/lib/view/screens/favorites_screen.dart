import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:ushop_app/logic/controller/product_controller.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({super.key});
  final controller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,

      body: Obx(() {
        if (controller.favoritesList.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset('assets/images/heart.png'),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'please add your favorite products.',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 18),
                )
              ],
            ),
          );
        } else {
          return ListView.separated(
              itemBuilder: ((context, index) {
                return buildFavoriteItems(
                  price: controller.favoritesList[index].price,
                  image: controller.favoritesList[index].image,
                  title: controller.favoritesList[index].title,
                  productId: controller.favoritesList[index].id,
                );
              }),
              separatorBuilder: ((context, index) {
                return Divider(
                  color: Colors.grey,
                  thickness: 1,
                );
              }),
              itemCount: controller.favoritesList.length);
        }

        // body: ListView.separated(
        //     itemBuilder: ((context, index) {
        //       return buildFavoriteItems();
        //     }),
        //     separatorBuilder: ((context, index) {
        //       return Divider(
        //         color: Colors.grey,
        //         thickness: 1,

        //       );
        //     }),
        //     itemCount: 10),
      }),

      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       SizedBox(
      //         height: 100,
      //         width: 100,
      //         child: Image.asset('assets/images/heart.png'),
      //       ),
      //       const SizedBox(
      //         height: 20,
      //       ),
      //       Text(
      //         'please add your favorite products.',
      //         style: TextStyle(
      //             fontWeight: FontWeight.bold,
      //             color: Get.isDarkMode ? Colors.white : Colors.black,
      //             fontSize: 18),
      //       )
      //     ],
      //   ),
      // ),

      // body:
    );
  }

  Widget buildFavoriteItems({
    required String image,
    required double price,
    required String title,
    required int productId,
  }) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        width: double.infinity,
        height: 100,
        child: Row(
          children: [
            SizedBox(
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    (image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              flex: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$title',
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '\$ $price',
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            IconButton(
                onPressed: () {
                  controller.manageFavorites(productId);
                },
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 30,
                ))
          ],
        ),
      ),
    );
  }
}
