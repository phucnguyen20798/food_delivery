import 'package:flutter/material.dart';
import 'package:food_delivery/presentation/widgets/items/item_hotel.dart';

class HotelView extends StatelessWidget {
  const HotelView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      shrinkWrap: true,
      itemBuilder: (context, index) => const ItemHotel(),
    );
  }
}
