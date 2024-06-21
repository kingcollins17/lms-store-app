// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_store_app/constants.dart';
import 'package:lms_store_app/controller/store_controller.dart';

class BottomNavBar extends GetWidget<StoreController> {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final nav = controller.navDestinations;
    return Container(
      decoration: BoxDecoration(),
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(nav.length,
            (index) => destination(nav[index], index == 0 ? true : false)),
      ),
    );
  }

  Widget destination(AppIcons icon, [bool isCurrent = false]) {
    return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: isCurrent ? AppColors.aliceBlue : null,
            borderRadius: BorderRadius.circular(6)),
        child: AppIcon(icon, color: Color(0xFF2B2B2B)));
  }
}
