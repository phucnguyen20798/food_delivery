import 'package:flutter/material.dart';
import 'package:food_delivery/presentation/widgets/items/item_hot_top.dart';

class HotTopRestaurant extends StatelessWidget {
  const HotTopRestaurant({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Text(
            'Top 10 quán ăn ngon nhất Vinh',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.green.shade700,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Row(
              children:
                  List.generate(20, (index) => const ItemHotTop()).toList(),
            )),
      ],
    );
  }
}
