// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ushop_app/model/product_model.dart';
import 'package:ushop_app/services/product_service.dart';

class ProductController extends GetxController {
  var productsList = <ProductModels>[].obs;
  var isLoading = true.obs;
  var favoritesList = <ProductModels>[].obs;

  var storage = GetStorage();
  var searchList = <ProductModels>[].obs;
  TextEditingController searchTextController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    List? storageShoppings = storage.read<List>('favoriteList');

    if (storageShoppings != null) {
      favoritesList =
          storageShoppings.map((e) => ProductModels.fromJson(e)).toList().obs;
    }

    getPorducts();
  }

  void getPorducts() async {
    var products = await ProductServices.getProduct();

    try {
      isLoading(true);
      if (products.isNotEmpty) {
        productsList.addAll(products);
      }
    } finally {
      isLoading(false);
    }
  }

//Logic For Favorite Screen.
  void manageFavorites(int productId) async {
    var existingIndex =
        favoritesList.indexWhere((element) => element.id == productId);
    // print(existingIndex);
    if (existingIndex >= 0) {
      favoritesList.removeAt(existingIndex);
      await storage.remove('isFavoriteList');
    } else {
      favoritesList
          .add(productsList.firstWhere((element) => element.id == productId));

      await storage.write("isFavorite", favoritesList);
    }

    // favoritesList.removeAt(existingIndex);
    // favoritesList
    //     .add(productsList.firstWhere((element) => element.id == productId));
  }

  bool isFavorites(int productId) {
    return favoritesList.any((element) => element.id == productId);
  }

  void addSearchToList(String searchName) {
    searchName = searchName.toLowerCase();

    searchList.value = productsList.where((search) {
      var searchTitle = search.title.toLowerCase();
      var searchPrice = search.price.toString().toLowerCase();

      return searchTitle.contains(searchName) ||
          searchPrice.toString().contains(searchName);
    }).toList();

    update();
  }

  void clearSearch() {
    searchTextController.clear();
    addSearchToList("");
  }
}
