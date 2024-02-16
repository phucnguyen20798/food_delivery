import 'package:flutter/material.dart';
import 'package:food_delivery/presentation/widgets/items/item_store.dart';

import '../../constants/app_color.dart';
import 'package:food_delivery/presentation/widgets/components/search_bar.dart'
    as searchBar;

import 'package:badges/badges.dart' as badges;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: const searchBar.SearchBar(),
        actions: [
          Center(
            child: badges.Badge(
              position: badges.BadgePosition.topEnd(
                top: -4.0,
                end: -10.0,
              ),
              showBadge: true,
              ignorePointer: false,
              onTap: () {},
              badgeContent: const Text(
                '10',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.white,
                ),
              ),
              badgeStyle: badges.BadgeStyle(
                shape: badges.BadgeShape.square,
                badgeColor: Colors.blue,
                padding: const EdgeInsets.all(5),
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(color: Colors.white, width: 2),
                elevation: 0,
              ),
              child: const Icon(
                Icons.notifications_none,
                color: Colors.black87,
                size: 32.0,
              ),
            ),
          ),
          const SizedBox(width: 16.0),
          const CircleAvatar(),
          const SizedBox(width: 16.0),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => const ItemStore(),
                separatorBuilder: (context, index) =>
                    Divider(color: AppColor.dividerColor, thickness: 12.0),
                itemCount: 30),
          )
        ],
      ),
    );
  }
}
