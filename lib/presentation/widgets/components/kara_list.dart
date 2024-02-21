import 'package:flutter/material.dart';
import 'package:food_delivery/presentation/widgets/items/item_kara.dart';

class KaraList extends StatelessWidget {
  const KaraList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 30,
      shrinkWrap: true,
      itemBuilder: (context, index) => const ItemKara(),
      separatorBuilder: (BuildContext context, int index) =>
          const SizedBox(height: 8.0),
    );
  }
}
