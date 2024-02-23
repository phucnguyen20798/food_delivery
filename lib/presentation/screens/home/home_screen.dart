import 'package:flutter/material.dart';
import 'package:food_delivery/presentation/widgets/components/hotel_view.dart';
import 'package:food_delivery/presentation/widgets/components/restaurant_list.dart';
import 'package:food_delivery/presentation/widgets/components/suggestion_view.dart';

import '../../widgets/components/kara_list.dart';

import 'package:food_delivery/presentation/widgets/components/search_bar.dart'
    as searchBar;

import '../../widgets/components/search_bar.dart';

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
            automaticallyImplyLeading: false,
            elevation: 0.0,
            title: InkWell(
                onTap: () {
                  showSearch(context: context, delegate: RestaurantDelegate());
                },
                child: const searchBar.SearchBar()),
            bottom: const TabBar(
                isScrollable: false,
                indicatorColor: Colors.white,
                indicatorPadding: EdgeInsets.only(bottom: 8.0),
                indicatorSize: TabBarIndicatorSize.tab,
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
