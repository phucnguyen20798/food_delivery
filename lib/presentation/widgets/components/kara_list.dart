import 'package:flutter/material.dart';
import 'package:food_delivery/presentation/widgets/items/item_suggestion.dart';

class KaraList extends StatelessWidget {
  const KaraList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 30,
      shrinkWrap: true,
      itemBuilder: (context, index) => const ItemSuggestion(),
    );
  }
}
