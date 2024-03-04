import 'package:flutter/material.dart';
import 'package:food_delivery/presentation/constants/app_constant.dart';

import '../../widgets/components/hotel_view.dart';
import '../../widgets/components/kara_list.dart';
import '../../widgets/components/restaurant_list.dart';
import '../../widgets/components/suggestion_view.dart';

import 'package:food_delivery/presentation/widgets/components/search_bar.dart'
    as searchBar;

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
                  //showSearch(context: context, delegate: RestaurantDelegate());
                  Navigator.pushNamed(context, AppConstant.detailRestaurant);
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
