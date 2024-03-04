import 'package:equatable/equatable.dart';
import 'package:food_delivery/data/models/food.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialHomeState extends HomeState {}

class FetchBestFavoriteFoodState extends HomeState {
  final List<Food> foods;

  FetchBestFavoriteFoodState(this.foods);

  @override
  List<Object?> get props => [foods];
}
