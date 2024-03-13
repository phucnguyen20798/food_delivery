import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../widgets/components/hotel_view.dart';
import '../../widgets/components/kara_list.dart';
import '../../widgets/components/restaurant_list.dart';
import '../../widgets/components/search_bar.dart';
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
                  showSearch(context: context, delegate: RestaurantDelegate());
                },
                child: const searchBar.SearchBar()),
            bottom: TabBar(
                isScrollable: false,
                indicatorColor: Colors.white,
                indicatorPadding: const EdgeInsets.only(bottom: 8.0),
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  Tab(text: 'suggest'.tr()),
                  Tab(text: 'restaurant'.tr()),
                  Tab(text: 'karaoke'.tr()),
                  Tab(text: 'hotel'.tr()),
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
