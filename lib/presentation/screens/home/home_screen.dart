import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/business_logic/blocs/home_bloc.dart';
import 'package:food_delivery/business_logic/events/home_event.dart';
import 'package:food_delivery/presentation/screens/home/home_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc()..add(InitialHomeEvent()),
      child: const HomeView(),
    );
  }
}
