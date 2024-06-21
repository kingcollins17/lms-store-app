// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lms_store_app/constants.dart';
import 'package:lms_store_app/products/screens/product_list_screen.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  double angle(int degrees) => (degrees * math.pi) / 180.0;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            children: [
              spacer(y: 10),
              _titleBar,
              spacer(y: 40),
              Expanded(
                flex: 3,
                child: Stack(
                  children: [
                    ...() {
                      const len = 5;
                      const deg = 360 / len;
                      return List.generate(
                          len,
                          (index) => Transform.rotate(
                                angle: angle((index * deg).ceil()),
                                child: _box(context,
                                    color:
                                        AppColors.processCyan.withOpacity(0.2)),
                              ));
                    }(),
                    Transform.rotate(
                      angle: angle(60),
                      child: _box(context,
                          color: AppColors.processCyan,
                          child: Image.asset(AppAssets.bat3.path)),
                    )
                  ],
                ),
              ),
              // spacer(y: 40),
              Text('Find & Buy your Badminton Equipments',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Worksans',
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  )),
              spacer(y: 20),
              Text(
                'You can find and buy any badminton equipment quickly and comfortably '
                'here all the equipment is complete',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Worksans',
                    color: Color(0xFF555555),
                    fontSize: 14),
              ),
              spacer(y: 30),
              button(
                'Explore Now',
                width: screen(context).width * 0.85,
                onPress: () {
                  Get.to(ProductListScreen());
                  Future.delayed(Duration(seconds: 2), () {
                    Get.snackbar('NOTE',
                        'Welcome to our store Ikeys, Open the drawer to add a new Product');
                  });
                },
              ),
              Expanded(child: spacer()),
            ],
          ),
        ),
      ),
    );
  }

  Container _box(BuildContext context, {required Color color, Widget? child}) {
    return Container(
      width: screen(context).width * 0.65,
      height: screen(context).width * 0.65,
      // margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(32),
      ),
      child: child,
    );
  }

  Widget button(String label, {required double width, VoidCallback? onPress}) {
    return InkWell(
      onTap: onPress,
      borderRadius: BorderRadius.circular(6),
      child: Ink(
        height: 54,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: AppColors.processCyan,
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                offset: Offset(2, 4),
                color: AppColors.processCyan.withOpacity(0.3),
              )
            ]),
        child: Center(
          child: Text(label,
              style: TextStyle(
                  fontFamily: 'Worksans',
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  Widget get _titleBar {
    return Row(
      children: [
        Container(
            padding: EdgeInsets.all(18),
            decoration: BoxDecoration(
                color: AppColors.catskillWhite, shape: BoxShape.circle),
            child: Text(
              Pictographs.bats.graph,
              style: TextStyle(fontSize: 18),
            )),
        spacer(x: 10),
        Text(
          'Colin Stores',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        )
      ],
    );
  }
}
