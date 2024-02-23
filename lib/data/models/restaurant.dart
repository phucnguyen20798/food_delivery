import 'package:food_delivery/data/models/time.dart';

import 'menu.dart';

class Restaurant {
  final String idRes;
  final String nameRes;
  final String address;
  final String logo;
  final List<String> categories;
  final Menu menu;
  final DateTime createDateTime;
  //Thời gian mở/đóng cửa hàng
  final Time time;

  Restaurant(
    this.idRes,
    this.nameRes,
    this.address,
    this.logo,
    this.categories,
    this.menu,
    this.createDateTime,
    this.time,
  );
  
}
