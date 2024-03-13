import 'package:flutter/material.dart';

class DetailRestaurantScreen extends StatelessWidget {
  const DetailRestaurantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text(
          'Chi tiết nhà hàng',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.white,
          ),
        ),
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}
