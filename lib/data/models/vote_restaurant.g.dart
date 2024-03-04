// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vote_restaurant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VoteRestaurant _$VoteRestaurantFromJson(Map<String, dynamic> json) =>
    VoteRestaurant(
      json['id'] as String,
      json['name'] as String,
      json['logo'] as String,
      (json['categories'] as List<dynamic>).map((e) => e as String).toList(),
      Location.fromJson(json['location'] as Map<String, dynamic>),
      (json['vote'] as num).toDouble(),
    );

Map<String, dynamic> _$VoteRestaurantToJson(VoteRestaurant instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
      'categories': instance.categories,
      'location': instance.location,
      'vote': instance.vote,
    };
