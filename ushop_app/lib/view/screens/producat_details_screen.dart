import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:ushop_app/model/product_model.dart';
import 'package:ushop_app/view/widgets/productDetails/image_slider.dart';

import '../widgets/productDetails/add_cart.dart';
import '../widgets/productDetails/clothes_info.dart';
import '../widgets/productDetails/size_list.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModels productModels;
  const ProductDetailsScreen({super.key, required this.productModels});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageSliders(imageUrl: productModels.image),
            ClothesInfo(
              productId: productModels.id,
              title: productModels.title,
              rate: productModels.rating.rate,
              descripton: productModels.description,
            ),
            SizeList(),
            AddCart(
              price: productModels.price,
              productModels: productModels,
            ),
          ],
        )),
      ),
    );
  }
}
