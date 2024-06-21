import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_store_app/constants.dart';

import '../models/models.dart';

class StoreController extends GetxController {
  final categories = [...productCategories].obs;

  final storeProducts = [...products].obs;

  RxInt? current = 0.obs;

  final navDestinations = [
    AppIcons.home,
    AppIcons.basket,
    AppIcons.favorite,
    AppIcons.user
  ];

  ///Functionality for adding a product
  void addProduct(ProductData value) {
    storeProducts.add(value);
  }
}
