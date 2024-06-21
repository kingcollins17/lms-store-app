import 'package:json_annotation/json_annotation.dart';
import 'package:lms_store_app/constants.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductData {
  final String name, description, type, flex;
  final double length, weight, ratings, price;

  @JsonKey(includeFromJson: false, includeToJson: false)
  final AppAssets? assetImage;

  factory ProductData.fromJson(Map<String, dynamic> json) =>
      _$ProductDataFromJson(json);

  const ProductData(
      {required this.name,
      required this.description,
      required this.type,
      required this.flex,
      required this.length,
      required this.weight,
      this.price = 52.50,
      this.assetImage,
      this.ratings = 4.8});
  Map<String, dynamic> toJson() => _$ProductDataToJson(this);
}
