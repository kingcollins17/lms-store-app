// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_store_app/constants.dart';
import 'package:lms_store_app/controller/store_controller.dart';
import 'package:lms_store_app/onboard/onboard.dart';

void main() {
  runApp(LmsStoreApp());
}

class LmsStoreApp extends StatelessWidget {
  const LmsStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => StoreController()); //add to dependencies lazily
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LMS Store App',
      theme: theme,
      home: OnboardScreen(),
    );
  }
}
