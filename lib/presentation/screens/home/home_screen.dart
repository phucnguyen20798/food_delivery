import 'package:flutter/material.dart';
import 'package:food_delivery/presentation/widgets/components/hotel_view.dart';
import 'package:food_delivery/presentation/widgets/components/restaurant_list.dart';
import 'package:food_delivery/presentation/widgets/components/suggestion_view.dart';

import '../../widgets/components/kara_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            titleSpacing: 16.0,
            backgroundColor: Colors.green.shade700,
            elevation: 0.0,
            title: Container(
              width: double.infinity,
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.search,
                    size: 18.0,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    'Tìm kiếm quán ăn, nhà hàng,...',
                    style: TextStyle(fontSize: 14.0, color: Colors.grey),
                  ),
                ],
              ),
            ),
            bottom: const TabBar(
                isScrollable: true,
                indicatorColor: Colors.white,
                indicatorPadding: EdgeInsets.only(bottom: 8.0),
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  Tab(text: 'Gợi ý'),
                  Tab(text: 'Quán ăn'),
                  Tab(text: 'Karaoke'),
                  Tab(text: 'Khách sạn'),
                ]),
          ),
          body: const TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                SuggestionView(),
                RestaurantList(),
                KaraList(),
                HotelView(),
              ])),
    );
  }
}
