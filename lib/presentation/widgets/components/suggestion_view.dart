import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/business_logic/blocs/home_bloc.dart';
import 'package:food_delivery/business_logic/states/home_state.dart';
import 'package:food_delivery/data/models/food.dart';
import 'package:food_delivery/presentation/widgets/components/loading_data.dart';
import 'package:food_delivery/presentation/widgets/items/item_favorite.dart';

import '../items/item_suggestion.dart';

List<Food> suggestionFoodList = [];

class SuggestionView extends StatelessWidget {
  const SuggestionView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      if (state is FetchBestFavoriteFoodState) {
        suggestionFoodList = state.foods;
      }
      return SingleChildScrollView(
        child: Column(
          children: [
            suggestionFoodList.isEmpty
                ? const LoadingData(loadingType: LoadingType.SUGGESTION)
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 12.0),
                        child: Text(
                          'Có thể bạn sẽ thích',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.green.shade700,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(
                                suggestionFoodList.length,
                                (index) => ItemSuggestion(
                                    food: suggestionFoodList[index])).toList(),
                          )),
                    ],
                  ),
            Divider(thickness: 12.0, color: Colors.grey.shade100),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 12.0),
                  child: Text(
                    'Những quán ăn được vote nhiều nhất',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.green.shade700,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Row(
                      children:
                          List.generate(20, (index) => const ItemFavorite())
                              .toList(),
                    )),
              ],
            )
          ],
        ),
      );
    });
  }
}
