// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) => Account(
      json['id'] as String,
      json['phone'] as String,
      json['fullName'] as String,
      json['sex'] as int,
      DateTime.parse(json['birthDay'] as String),
    );

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'id': instance.id,
      'phone': instance.phone,
      'fullName': instance.fullName,
      'sex': instance.sex,
      'birthDay': instance.birthDay.toIso8601String(),
    };
