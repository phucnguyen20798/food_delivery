import 'package:flutter/material.dart';
import 'package:food_delivery/presentation/widgets/items/item_favorite.dart';

import '../items/item_suggestion.dart';

class SuggestionView extends StatelessWidget {
  const SuggestionView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Text(
              'Có thể bạn sẽ thích',
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
                children: List.generate(30, (index) => const ItemSuggestion())
                    .toList(),
              )),
          Divider(thickness: 12.0, color: Colors.grey.shade100),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Text(
              'Những quán ăn được vote nhiều nhất',
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
                    List.generate(20, (index) => const ItemFavorite()).toList(),
              )),
        ],
      ),
    );
  }
}
