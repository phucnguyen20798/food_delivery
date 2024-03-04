import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/business_logic/events/home_event.dart';
import 'package:food_delivery/business_logic/states/home_state.dart';
import 'package:food_delivery/data/repositories/food_delivery_repository.dart';
import 'package:food_delivery/di.dart';

import '../../data/models/food.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final repository = getIt.get<FoodDeliveryRepository>();

  HomeBloc() : super(InitialHomeState()) {
    on<InitialHomeEvent>(_onFetchRestaurantList);
  }

  Future<void> _onFetchRestaurantList(
      InitialHomeEvent event, Emitter<HomeState> emitter) async {
    List<Food> bestFavoriteFoods = await repository.getBestFavoriteFood();
    //List<Restaurant> bestVoteRestaurant = [];
    emitter(FetchBestFavoriteFoodState(bestFavoriteFoods));
  }
}
 