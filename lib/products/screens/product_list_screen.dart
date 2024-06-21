// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_store_app/constants.dart';
import 'package:lms_store_app/controller/store_controller.dart';
import 'package:lms_store_app/products/screens/product_detail_screen.dart';
import 'package:lms_store_app/products/widgets/category_card.dart';
import 'package:lms_store_app/products/widgets/nav_drawer.dart';
import 'package:lms_store_app/products/widgets/product_card.dart';
import 'package:lms_store_app/products/widgets/widgets.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Get.snackbar(
          'NOTE', 'Please open the navigation drawer to add a new PRODUCT');
    });
    return Stack(
      children: [
        Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            leading: Align(
                child: GestureDetector(
                    onTap: () => scaffoldKey.currentState?.openDrawer(),
                    child: AppIcon(AppIcons.menu))),
            actions: [
              spacer(),
              Icon(Icons.notifications_none_outlined, size: 28),
              spacer()
            ],
          ),
          drawer: SideNavDrawer(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Text(
                  'Hi, Shopper 🏸',
                  style: TextStyle(
                      fontFamily: 'Worksans',
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ).align(Alignment.centerLeft),
                spacer(y: 20),
                searchBar,
                spacer(y: 25),
                banner,
                spacer(y: 20),
                Text(
                  'Product Categories',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Worksans'),
                ).align(Alignment.centerLeft),
                spacer(y: 15),
                categories,
                spacer(y: 20),
                productsList,
                spacer(y: 20),
              ],
            ),
          ),
        ),
        Positioned(
            width: screen(context).width, bottom: 5, child: BottomNavBar())
      ],
    );
  }

  Widget get productsList {
    final controller = Get.find<StoreController>();
    return Obx(() {
      return SizedBox(
        height: 200,
        child: ListView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 6),
          children: List.generate(
            controller.storeProducts.length,
            (index) => Center(
              child: GestureDetector(
                onTap: () => Get.to(ProductDetailScreen(
                    product: controller.storeProducts[index])),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: ProductCard(controller.storeProducts[index]),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget get categories {
    return SizedBox(
        height: 55.0,
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 4),
          scrollDirection: Axis.horizontal,
          children: List.generate(productCategories.length,
              (index) => CategoryCard(category: productCategories[index])),
        ));
  }

  Widget get banner {
    return Container(
      width: screen(context).width,
      constraints: BoxConstraints(minHeight: 120),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.processCyan,
      ),
      child: Stack(
        // crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'GET A 20% DISCOUNT FOR PURCHASING RACKETS',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontFamily: 'Worksans',
                  fontWeight: FontWeight.w500,
                ),
              ),
              spacer(y: 20),
              Row(
                children: [
                  Container(
                    height: 35,
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                      child: Text(
                        'Buy Now',
                        style: TextStyle(
                            fontSize: 16, color: AppColors.processCyan),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          Positioned(
              right: 10,
              bottom: 30,
              child: Image.asset('asset/images/ball2.png', width: 80))
        ],
      ),
    );
  }

  Row get searchBar {
    return Row(
      children: [
        Expanded(child: inputField),
        spacer(x: 15),
        Container(
          height: 50.0,
          width: 50.0,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.white,
              boxShadow: [
                BoxShadow(blurRadius: 3, color: Color(0x2F000000)),
                BoxShadow(
                    blurRadius: 3,
                    offset: Offset(1, 3),
                    color: AppColors.processCyan.withOpacity(0.2)),
              ]),
          child: Icon(Icons.equalizer_rounded,
              color: AppColors.processCyan, size: 18),
        )
      ],
    );
  }

  Widget get inputField {
    return Container(
      height: 50.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 3, color: Color(0x2F000000))]),
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search, size: 20, color: Color(0xFF5C5C5C)),
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
