// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemMenu _$ItemMenuFromJson(Map<String, dynamic> json) => ItemMenu(
      json['nameMenu'] as String,
      (json['foods'] as List<dynamic>)
          .map((e) => Food.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ItemMenuToJson(ItemMenu instance) => <String, dynamic>{
      'nameMenu': instance.nameMenu,
      'foods': instance.foods,
    };
