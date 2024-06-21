import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'models/models.dart';

final theme = ThemeData(
  // fontFamily:
  colorScheme: ColorScheme.light(
      primary: AppColors.processCyan, secondary: AppColors.aliceBlue),
);

sealed class AppColors {
  static Color processCyan = const Color(0xFF56B7E0);

  static Color aliceBlue = const Color(0xFFEEF8FC);

  static Color catskillWhite = const Color(0xFFEFF9FC);
}

enum AppIcons {
  favorite('asset/icons/favourite-stroke-rounded.svg'),
  home('asset/icons/home-03-stroke-rounded.svg'),
  menu('asset/icons/menu-02-stroke-rounded.svg'),
  basket('asset/icons/shopping-basket-done-02-stroke-rounded.svg'),
  user('asset/icons/user-stroke-rounded.svg');

  final String path;

  const AppIcons(this.path);
}

enum Pictographs {
  ball('🏈'),
  bats('🏓'),
  electronics('💻'),
  wears('👗'),
  bags('👜'),
  groceries('🍟'),
  sneakers('👟');

  final String graph;
  const Pictographs(this.graph);
}

class AppIcon extends StatelessWidget {
  const AppIcon(this.icon, {super.key, this.size = 24, this.color});
  final AppIcons icon;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size,
      child: SvgPicture.asset(
        icon.path,
        // width: size,
        // height: size,
        color: color,
      ),
    );
  }
}

enum AppAssets {
  ball1('asset/images/ball2.png'),
  ball2('asset/images/ball2.png'),
  bat1('asset/images/bat1.png'),
  bat2('asset/images/bat2.png'),
  bat3('asset/images/bat.png'),
  football('asset/images/football.png'),
  hoodie1('asset/images/hoodie.png'),
  hoodie2('asset/images/hoodie1.png'),
  laptop1('asset/images/laptop.png'),
  laptop2('asset/images/laptop1.png'),
  phone1('asset/images/phone1.png'),
  phone2('asset/images/phone2.png'),
  sneaker1('asset/images/sneaker.png'),
  sneaker2('asset/images/sneaker2.png'),
  sneaker3('asset/images/sneaker3.png');

  final String path;

  const AppAssets(this.path);
}

const productCategories = [
  '🏸   Rackets',
  '🏈   Balls',
  '👟   Shoes',
  '👕   Outfits',
  '💻   Electronics',
  // '🍟   Groceries'
];

const products = <ProductData>[
  ProductData(
      name: 'Victor Arrow Racket',
      description: '',
      type: 'Power',
      flex: 'Medium',
      length: 675,
      weight: 80,
      assetImage: AppAssets.bat1),
  ProductData(
      name: 'Colin Power Shoe',
      description: '',
      type: 'Power',
      flex: 'Medium',
      length: 675,
      assetImage: AppAssets.sneaker1,
      weight: 80),
  ProductData(
      name: 'XT Drop Sneaker',
      description: '',
      type: 'Power',
      flex: 'High',
      length: 100,
      price: 25.0,
      assetImage: AppAssets.sneaker3,
      weight: 30),
  ProductData(
      name: 'St John Racket',
      description: '',
      type: 'Mystery',
      flex: 'Low',
      length: 675,
      assetImage: AppAssets.bat2,
      weight: 80),
  ProductData(
      name: 'STX Gaming PC',
      description: '',
      type: 'VR',
      flex: 'High',
      length: 90,
      assetImage: AppAssets.laptop2,
      weight: 10),
  ProductData(
      name: 'Oppo Multi Touch',
      description: '',
      type: 'Gaming',
      flex: 'High',
      length: 675,
      assetImage: AppAssets.phone2,
      weight: 80),
];

Widget spacer({double x = 5, double y = 5}) => SizedBox(height: y, width: x);

Size screen(BuildContext context) => MediaQuery.sizeOf(context);

extension ExtAlign on Widget {
  Align align(Alignment value) => Align(alignment: value, child: this);
}
