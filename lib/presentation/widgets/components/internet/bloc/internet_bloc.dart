import 'dart:developer';

import 'package:bloc/bloc.dart';

import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:equatable/equatable.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  InternetCubit() : super(InternetInitial()) {
    _checkConnectInternet();
  }

  Future<void> _checkConnectInternet() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.wifi) {
      log('Check Internet connected');
      emit(ConnectInternet());
    } else if (connectivityResult == ConnectivityResult.none) {
      log('Check Internet disconnected');
      emit(DisconnectInternet());
    }
    Connectivity().onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.wifi) {
        log('Internet connected');
        emit(ConnectInternet());
      } else if (event == ConnectivityResult.none) {
        log('Internet disconnected');
        emit(DisconnectInternet());
      }
    });
  }
}
