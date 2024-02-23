import 'package:food_delivery/presentation/utils/text_utils.dart';

import 'food.dart';

class Menu {
  String nameMenu;
  List<Food> foods;

  Menu(this.nameMenu, this.foods);

  String getMinPrice() {
    foods.sort();
    return TextUtils.formatMoney(foods.first.cost);
  }

  String getMaxPrice() {
    foods.sort();
    return TextUtils.formatMoney(foods.last.cost);
  }

  Food getFavoriteFood() {
    foods.sort((a, b) => a.vote.compareTo(b.vote));
    return foods.last;
  }
}
