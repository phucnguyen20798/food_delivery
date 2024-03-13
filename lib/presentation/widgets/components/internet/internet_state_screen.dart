import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/presentation/widgets/components/internet/view/internet_state_view.dart';

import 'bloc/internet_bloc.dart';

class InternetStateScreen extends StatelessWidget {
  final Widget? child;

  const InternetStateScreen({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => InternetCubit(),
      child: InternetStateView(child: child),
    );
  }
}
