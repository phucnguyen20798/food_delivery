import 'package:food_delivery/data/models/restaurant.dart';
import 'package:json_annotation/json_annotation.dart';

part 'food.g.dart';

@JsonSerializable()
class Food {
  final String id;
  final String name;
  final double cost;
  final String? desc;
  final bool isActived;
  final String image;
  final double vote;
  final double? discount;
  final Restaurant restaurant;

  Food(
    this.id,
    this.name,
    this.cost,
    this.desc,
    this.isActived,
    this.image,
    this.vote,
    this.discount,
    this.restaurant,
  );

  factory Food.fromJson(Map<String, dynamic> json) => _$FoodFromJson(json);

  Map<String, dynamic> toJson() => _$FoodToJson(this);
}
