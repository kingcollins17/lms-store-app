// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:currency_symbols/currency_symbols.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_store_app/constants.dart';
import 'package:lms_store_app/controller/store_controller.dart';
import 'package:lms_store_app/models/models.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(this.data, {super.key});
  final ProductData data;

  @override
  Widget build(BuildContext context) {
    const height = 180.0;
    final width = screen(context).width * 0.4;
    return Container(
      // height: height,
      constraints: BoxConstraints(maxHeight: height),
      width: width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [BoxShadow(blurRadius: 3, color: Color(0x2B000000))]),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: imageCard,
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4),
              child: Text(
                data.name,
                style: TextStyle(
                  fontFamily: 'Worksans',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ).align(Alignment.centerLeft),
            ),
          ),
          spacer(),
          priceTag,
          spacer(),
        ],
      ),
    );
  }

  Widget get priceTag => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                '${cSymbol('USD')}${data.price.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Icon(Icons.star, color: Colors.yellow, size: 20),
            Text(data.ratings.toStringAsFixed(1))
          ],
        ),
      );
  Widget get imageCard {
    return Container(
      height: 110,
      decoration: BoxDecoration(
        color: AppColors.aliceBlue,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Center(
        child: Image.asset(data.assetImage!.path),
      ),
    );
  }
}
