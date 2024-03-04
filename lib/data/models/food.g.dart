// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Food _$FoodFromJson(Map<String, dynamic> json) => Food(
      json['id'] as String,
      json['name'] as String,
      (json['cost'] as num).toDouble(),
      json['desc'] as String?,
      json['isActived'] as bool,
      json['image'] as String,
      (json['vote'] as num).toDouble(),
      (json['discount'] as num?)?.toDouble(),
      Restaurant.fromJson(json['restaurant'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FoodToJson(Food instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'cost': instance.cost,
      'desc': instance.desc,
      'isActived': instance.isActived,
      'image': instance.image,
      'vote': instance.vote,
      'discount': instance.discount,
      'restaurant': instance.restaurant,
    };
