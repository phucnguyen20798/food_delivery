import 'package:flutter/material.dart';
import 'package:food_delivery/presentation/widgets/items/item_store.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1.0,
          title: ListTile(
              leading: Image.asset('assets/images/icon_app.png'),
              title: const Text(
                'Giao hàng đồ ăn',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.lightGreen,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: const Text(
                'Nhanh chóng, vệ sinh và tiết kiệm',
                maxLines: 1,
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.lightGreen,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => const ItemStore(),
                separatorBuilder: (context, index) =>
                    Divider(color: Colors.grey.shade100, thickness: 12.0),
                itemCount: 30),
          )
        ],
      ),
    );
  }
}
