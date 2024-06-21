// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lms_store_app/constants.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard(
      {super.key, required this.category, this.isCurrent = false});
  final String category;
  final bool isCurrent;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: 100),
      margin: EdgeInsets.symmetric(horizontal: 4),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
          color: isCurrent ? AppColors.processCyan : Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              offset: Offset(1, 0),
              color: AppColors.processCyan.withOpacity(0.3),
            ),
          ]),
      child: Center(
          child: Text(
        category,
        style: TextStyle(
            fontFamily: 'Worksans',
            color: isCurrent ? Colors.white : Color(0xFF181818)),
      )),
    );
  }
}
