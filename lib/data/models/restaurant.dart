import 'package:json_annotation/json_annotation.dart';

import 'location.dart';

part 'restaurant.g.dart';

@JsonSerializable()
class Restaurant {
  final String id;
  final String name;
  final String logo;
  final List<String> categories;
  final Location location;

  Restaurant(
    this.id,
    this.name,
    this.logo,
    this.categories,
    this.location,
  );

  factory Restaurant.fromJson(Map<String, dynamic> json) =>
      _$RestaurantFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantToJson(this);
}
