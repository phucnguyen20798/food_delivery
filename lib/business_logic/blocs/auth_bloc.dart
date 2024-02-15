import 'package:bloc/bloc.dart';
import 'package:food_delivery/business_logic/events/auth_event.dart';
import 'package:food_delivery/business_logic/states/auth_state.dart';

import '../../data/models/slide.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  List<Slide> slides = [
    Slide('food_delivery', null, 'assets/images/food-delivery.jpg'),
    Slide('share_voucher.title', 'share_voucher.desc', 'assets/images/share-voucher.jpg'),
    Slide('food_delivery', null, 'assets/images/food-delivery.jpg'),
  ];
  AuthBloc() : super(EmptyState()) {
    on(_onInit);
    on(_onChangeLanguage);
    on(_onReloadUIScreen);
  }

  void _onInit(InitAuthEvent event, Emitter<AuthState> emitter) {
    emitter(InitAuthState(slides));
  }

  void _onChangeLanguage(
      ChangeLanguageEvent event, Emitter<AuthState> emitter) {
    emitter(ChangeLanguageState(event.locale));
  }

  void _onReloadUIScreen(
      ReloadUIScreenEvent event, Emitter<AuthState> emitter) {
    emitter(ReloadUIScreenState(event.language));
  }
}
