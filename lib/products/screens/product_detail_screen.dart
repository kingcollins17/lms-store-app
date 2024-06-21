// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:currency_symbols/currency_symbols.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:get/get.dart';
import 'package:lms_store_app/constants.dart';
import 'package:lms_store_app/models/models.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});
  final ProductData product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Get.back(closeOverlays: true),
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 22,
            color: Color(0xFF252525),
          ),
        ),
        actions: [
          spacer(),
          GestureDetector(
              onTap: () {
                final url = Uri.http(
                    'colinstores.app', '/products/${product.name}', {
                  'type': product.type,
                  'flex': product.flex,
                  'length': product.length.toString()
                });
                Share.share(
                    'Hi, check out this product ${product.name} at $url');
              },
              child: Icon(Icons.share, size: 24, color: Color(0xFF252525))),
          spacer(x: 20)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    product.name,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Icon(Icons.star, size: 22, color: Colors.yellow),
                spacer(),
                Text(
                  product.ratings.toStringAsFixed(1),
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
            // spacer(),
            spacer(y: 40),
            Expanded(child: layout),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                product.description.isEmpty
                    ? 'The product is designed for fast speed all round play.'
                        ' Weighing only ${product.weight} grams and having an '
                        'even balanced weight. The product is fairly easy to use '
                        'and maneuver to gain utility'
                    : product.description,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Worksans',
                  color: Color(0xFF3B3B3B),
                ),
              ).align(Alignment.centerLeft),
            ),
            spacer(y: 40),
            Row(
              children: [
                favoriteIcon,
                spacer(),
                Expanded(
                  child: button(
                      'Buy Now ${cSymbol('USD')}${product.price.toStringAsFixed(2)}'),
                ),
              ],
            ),
            spacer(y: 20)
          ],
        ),
      ),
    );
  }

  Widget get favoriteIcon => Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                  blurRadius: 4, color: AppColors.processCyan.withOpacity(0.2))
            ]),
        child: Center(
          child: AppIcon(AppIcons.favorite, color: Color(0xFF4D4D4D)),
        ),
      );
  Widget button(String label, {double? width, VoidCallback? onTap}) => InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Ink(
          height: 48,
          width: width,
          decoration: BoxDecoration(
              color: AppColors.processCyan,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                    blurRadius: 4,
                    color: AppColors.processCyan.withOpacity(0.2))
              ]),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                  fontFamily: 'Worksans',
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      );

  Widget get layout => Row(
        children: [
          Expanded(flex: 1, child: sideTile),
          spacer(x: 10),
          Expanded(flex: 2, child: productImage)
        ],
      );

  Widget get productImage => Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [BoxShadow(blurRadius: 4, color: Color(0x1A000000))]),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(color: AppColors.aliceBlue),
          child: Center(
            child: Image.asset(product.assetImage!.path),
          ),
        ),
      );

  Widget get sideTile => Column(
        children: [
          propCard('Type', product.type),
          propCard('Flex', product.flex),
          propCard('Head', 'Isometric'),
          propCard('Lenght', product.length.toString()),
          propCard('Weight', product.weight.toInt().toString())
        ],
      );

  Widget propCard(String prop, String value) => Container(
        margin: EdgeInsets.symmetric(vertical: 4),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                color: AppColors.processCyan.withOpacity(0.3),
              )
            ]),
        child: Center(
          child: Column(
            children: [
              Text(
                prop,
                style: TextStyle(fontSize: 16, fontFamily: 'Worksans'),
              ),
              Text(
                value,
                style: TextStyle(
                    fontSize: 16,
                    color: AppColors.processCyan,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      );
}
