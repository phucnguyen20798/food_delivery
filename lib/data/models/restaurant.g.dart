// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Restaurant _$RestaurantFromJson(Map<String, dynamic> json) => Restaurant(
      json['id'] as String,
      json['name'] as String,
      json['logo'] as String,
      (json['categories'] as List<dynamic>).map((e) => e as String).toList(),
      Location.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RestaurantToJson(Restaurant instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
      'categories': instance.categories,
      'location': instance.location,
    };
