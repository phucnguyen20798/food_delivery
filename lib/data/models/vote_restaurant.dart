import 'package:food_delivery/data/models/restaurant.dart';
import 'package:json_annotation/json_annotation.dart';

import 'location.dart';

part 'vote_restaurant.g.dart';

@JsonSerializable()
class VoteRestaurant extends Restaurant {
  final double vote;

  VoteRestaurant(
    super.id,
    super.name,
    super.logo,
    super.categories,
    super.location,
    this.vote,
  );

  factory VoteRestaurant.fromJson(Map<String, dynamic> json) =>
      _$VoteRestaurantFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$VoteRestaurantToJson(this);
}
