import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/business_logic/blocs/auth_bloc.dart';
import 'package:food_delivery/business_logic/events/auth_event.dart';

import 'auth_view.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthBloc()..add(InitAuthEvent()),
      child: const AuthView(),
    );
  }
}
