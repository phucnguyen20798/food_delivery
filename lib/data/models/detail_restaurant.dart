import 'package:food_delivery/data/models/location.dart';
import 'package:food_delivery/data/models/time.dart';
import 'package:food_delivery/presentation/utils/text_utils.dart';
import 'package:json_annotation/json_annotation.dart';

import 'food.dart';
import 'item_menu.dart';

part 'detail_restaurant.g.dart';

@JsonSerializable()
class DetailRestaurant {
  final String idRes;
  final String nameRes;
  final String address;
  final String logo;
  final List<String> categories;
  final List<ItemMenu> menu;
  final DateTime createDateTime;
  //Thời gian mở/đóng cửa hàng
  final Time? time;
  final Location location;
  final double rating;

  DetailRestaurant(
    this.idRes,
    this.nameRes,
    this.address,
    this.logo,
    this.categories,
    this.menu,
    this.createDateTime,
    this.rating,
    this.time,
    this.location,
  );

  factory DetailRestaurant.fromJson(Map<String, dynamic> json) =>
      _$DetailRestaurantFromJson(json);

  Map<String, dynamic> toJson() => _$DetailRestaurantToJson(this);

  Food getBestFavoriteFood() {
    List<Food> favoriteFoods = [];
    for (var itemMenu in menu) {
      Food food = itemMenu.getFavoriteFood();
      favoriteFoods.add(food);
    }
    favoriteFoods.sort((item1, item2) => item1.vote.compareTo(item2.vote));
    return favoriteFoods.last;
  }

  String getMinPrice() {
    menu.sort(
        (item1, item2) => item1.getMinPrice().compareTo(item2.getMinPrice()));
    return TextUtils.formatMoney(menu.first.foods.first.cost);
  }

  String getMaxPrice() {
    menu.sort(
        (item1, item2) => item1.getMaxPrice().compareTo(item2.getMaxPrice()));
    return TextUtils.formatMoney(menu.last.foods.last.cost);
  }
}
