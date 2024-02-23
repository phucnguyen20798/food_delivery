import 'package:json_annotation/json_annotation.dart';
part 'account.g.dart';

@JsonSerializable()
class Account {
  String id;
  String phone;
  String fullName;
  int sex;
  DateTime birthDay;

  Account(
    this.id,
    this.phone,
    this.fullName,
    this.sex,
    this.birthDay,
  );

  factory Account.fromJson(Map<String, dynamic> json) => _$AccountFromJson(json);

  Map<String, dynamic> toJson() => _$AccountToJson(this);
}
