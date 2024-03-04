import 'package:json_annotation/json_annotation.dart';

import 'food.dart';

part 'item_menu.g.dart';

@JsonSerializable()
class ItemMenu {
  String nameMenu;
  List<Food> foods;

  ItemMenu(this.nameMenu, this.foods);

  factory ItemMenu.fromJson(Map<String, dynamic> json) => _$ItemMenuFromJson(json);

  Map<String, dynamic> toJson() => {
    "nameMenu": nameMenu,
    "foods": foods.map((e) => e.toJson()).toList()
  };

  double getMinPrice() {
    foods.sort();
    return foods.first.cost;
  }

  double getMaxPrice() {
    foods.sort();
    return foods.last.cost;
  }

  Food getFavoriteFood() {
    foods.sort((a, b) => a.vote.compareTo(b.vote));
    return foods.last;
  }
}
