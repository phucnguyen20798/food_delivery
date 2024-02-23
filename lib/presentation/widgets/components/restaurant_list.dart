import 'package:flutter/material.dart';

import '../items/item_restaurant.dart';

class RestaurantList extends StatelessWidget {
  const RestaurantList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) => const ItemRestaurant(),
        itemCount: 30);
  }
}

