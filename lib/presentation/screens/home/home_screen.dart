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
      length: 3,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            titleSpacing: 16.0,
            backgroundColor: Colors.green.shade700,
            elevation: 0.0,
            title: InkWell(
              onTap: () {
                showSearch(context: context, delegate: RestaurantDelegate());
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 14.0),
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
            ),
            bottom: const TabBar(
                isScrollable: false,
                indicatorColor: Colors.white,
                indicatorPadding: EdgeInsets.only(bottom: 8.0),
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  Tab(text: 'Gợi ý'),
                  Tab(text: 'Quán ăn'),
                  Tab(text: 'Karaoke'),
                  //Tab(text: 'Khách sạn'),
                ]),
          ),
          body: const TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                SuggestionView(),
                RestaurantList(),
                KaraList(),
                // HotelView(),
              ])),
    );
  }
}

class RestaurantDelegate extends SearchDelegate {
  
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
        appBarTheme: const AppBarTheme(elevation: 0.0),
        inputDecorationTheme: InputDecorationTheme(
          border: InputBorder.none,
        ));
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Column(
      children: [],
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Column(
      children: [],
    );
  }
}
