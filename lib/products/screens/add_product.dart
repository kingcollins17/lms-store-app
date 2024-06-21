// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lms_store_app/constants.dart';
import 'package:lms_store_app/controller/store_controller.dart';
import 'package:lms_store_app/models/models.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final formKey = GlobalKey<FormState>();

  var selectedImage = 0;

  String? name, price, description, type, flex, length, weight;

  void _addProduct() {
    final controller = Get.find<StoreController>();
    controller.addProduct(ProductData(
        name: name!,
        price: double.parse(price!),
        description: description!,
        assetImage: AppAssets.values[selectedImage],
        type: type!,
        flex: flex!,
        length: double.parse(length!),
        weight: double.parse(weight!)));
  }

  Widget get imageSelector {
    return Wrap(
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.spaceAround,
      children: List.generate(
        AppAssets.values.length,
        (index) => GestureDetector(
          onTap: () => setState(() {
            selectedImage = index;
          }),
          child: Container(
              width: 70,
              height: 70,
              margin: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: selectedImage == index
                      ? Border.all(color: AppColors.processCyan)
                      : null,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 4,
                        color: AppColors.processCyan.withOpacity(0.2))
                  ]),
              child: imageBox(AppAssets.values[index].path)),
        ),
      ),
    );
  }

  Widget imageBox(String path) => Image.asset(path, width: 65);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Get.back(closeOverlays: true),
          child: Icon(Icons.arrow_back_ios_rounded,
              size: 22, color: Color(0xFF414141)),
        ),
        title: Text(
          'Add Product',
          style: TextStyle(fontSize: 18, fontFamily: 'Worksans'),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  InputField(
                      label: 'Product Name',
                      onChanged: (value) => name = value),
                  InputField(
                      label: 'Price',
                      onChanged: (value) => price = value,
                      inputType: TextInputType.number),
                  InputField(label: 'Type', onChanged: (value) => type = value),
                  InputField(label: 'Flex', onChanged: (value) => flex = value),
                  InputField(
                      label: 'Length',
                      onChanged: (value) => length = value,
                      inputType: TextInputType.number),
                  InputField(
                      label: 'Weight',
                      onChanged: (value) => weight = value,
                      inputType: TextInputType.number),
                  spacer(y: 20),
                  Text(
                    'Pick Image',
                    style: TextStyle(fontSize: 16, fontFamily: 'Worksans'),
                  ).align(Alignment.centerLeft),
                  spacer(y: 15),
                  imageSelector,
                  spacer(y: 20),
                  Text(
                    'Product Description',
                    style: TextStyle(fontFamily: 'Worksans', fontSize: 16),
                  ).align(Alignment.centerLeft),
                  spacer(y: 15),
                  TextFormField(
                    maxLines: 5,
                    minLines: 4,
                    onChanged: (value) => description = value,
                    validator: (value) => value == null || value.isEmpty
                        ? "Product description is required"
                        : null,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                  spacer(y: 40),
                  button('Add Product', onTap: () {
                    if (formKey.currentState?.validate() ?? false) {
                      try {
                        _addProduct();
                        Future.delayed(Duration(seconds: 1),
                            () => Get.back(closeOverlays: true));
                      } catch (e) {
                        Get.snackbar('An error occurred', '$e');
                      }
                      Get.snackbar(
                          'Product added!', 'New product has been added');
                    } else {
                      Get.snackbar('Error',
                          'Please make sure all product information is entered');
                    }
                  })
                ],
              ),
            )),
      ),
    );
  }

  Widget button(String label, {required VoidCallback onTap}) => InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Ink(
          height: 48,
          decoration: BoxDecoration(
              color: AppColors.processCyan,
              borderRadius: BorderRadius.circular(12)),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Worksans'),
            ),
          ),
        ),
      );
}

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.label,
    this.inputType,
    this.onChanged,
  });
  final String label;
  final void Function(String value)? onChanged;
  final TextInputType? inputType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 10),
      child: TextFormField(
        keyboardType: inputType,
        validator: (value) =>
            value == null || value.isEmpty ? 'This field is required' : null,
        onChanged: onChanged,
        decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(
              fontWeight: FontWeight.normal,
              fontFamily: 'Worksans',
            ),
            border: OutlineInputBorder()),
      ),
    );
  }
}
