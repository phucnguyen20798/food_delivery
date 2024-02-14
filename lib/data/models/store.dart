import 'package:food_delivery/data/models/time.dart';

import 'menu.dart';

class Store {
  final String idStore;
  final String nameStore;
  final String address;
  final String logo;
  final List<String> categories;
  final Menu menu;
  final DateTime createDateTime;
  //Thời gian mở/đóng cửa hàng
  final Time time;

  Store(
    this.idStore,
    this.nameStore,
    this.address,
    this.logo,
    this.categories,
    this.menu,
    this.createDateTime,
    this.time,
  );
}
