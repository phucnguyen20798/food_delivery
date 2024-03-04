// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_restaurant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailRestaurant _$DetailRestaurantFromJson(Map<String, dynamic> json) =>
    DetailRestaurant(
      json['idRes'] as String,
      json['nameRes'] as String,
      json['address'] as String,
      json['logo'] as String,
      (json['categories'] as List<dynamic>).map((e) => e as String).toList(),
      (json['menu'] as List<dynamic>)
          .map((e) => ItemMenu.fromJson(e as Map<String, dynamic>))
          .toList(),
      DateTime.parse(json['createDateTime'] as String),
      (json['rating'] as num).toDouble(),
      json['time'] == null
          ? null
          : Time.fromJson(json['time'] as Map<String, dynamic>),
      Location.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DetailRestaurantToJson(DetailRestaurant instance) =>
    <String, dynamic>{
      'idRes': instance.idRes,
      'nameRes': instance.nameRes,
      'address': instance.address,
      'logo': instance.logo,
      'categories': instance.categories,
      'menu': instance.menu,
      'createDateTime': instance.createDateTime.toIso8601String(),
      'rating': instance.rating,
      'time': instance.time,
      'location': instance.location,
    };
