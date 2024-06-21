// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_store_app/constants.dart';
import 'package:lms_store_app/products/screens/add_product.dart';

class SideNavDrawer extends StatelessWidget {
  const SideNavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                'Colins Stores 🏀',
                style: TextStyle(
                    fontFamily: 'Worksans',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ).align(Alignment.centerLeft),
              spacer(y: 40),
              GestureDetector(
                onTap: () => Get.to(AddProductScreen()),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                  decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 4,
                            offset: Offset(1, 3),
                            color: Color(0x29000000))
                      ]),
                  child: Row(
                    children: [
                      Icon(Icons.add, size: 24, color: AppColors.processCyan),
                      spacer(),
                      Text(
                        'Add Product',
                        style: TextStyle(fontFamily: 'Worksans', fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
