// ignore_for_file: unused_field

import 'package:hive_flutter/hive_flutter.dart';

class StocksDatabase {
  // list of item stocks
  List listStocks = [];

  // references the box
  final _myBox = Hive.box('myBox');

  // first time opening elibaps
  void createInitialData() {
    listStocks = [
      ["Sample Item", 25, 1],
    ];
  }

  // load previous data
  void loadData() {
    listStocks = _myBox.get("STOCKS");
  }

  void updateData() {
    _myBox.put("STOCKS", listStocks);
  }
}
