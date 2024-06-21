// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductData _$ProductDataFromJson(Map<String, dynamic> json) => ProductData(
      name: json['name'] as String,
      description: json['description'] as String,
      type: json['type'] as String,
      flex: json['flex'] as String,
      length: (json['length'] as num).toDouble(),
      weight: (json['weight'] as num).toDouble(),
      price: (json['price'] as num?)?.toDouble() ?? 52.50,
      ratings: (json['ratings'] as num?)?.toDouble() ?? 4.8,
    );

Map<String, dynamic> _$ProductDataToJson(ProductData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'type': instance.type,
      'flex': instance.flex,
      'length': instance.length,
      'weight': instance.weight,
      'ratings': instance.ratings,
      'price': instance.price,
    };
