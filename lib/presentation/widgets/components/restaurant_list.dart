import 'package:flutter/material.dart';

import '../items/item_restaurant.dart';

class RestaurantList extends StatelessWidget {
  const RestaurantList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) => const ItemRestaurant(),
          itemCount: 30),
    );
  }
}

