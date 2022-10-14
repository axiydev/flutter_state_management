import 'package:flutter/material.dart';

abstract class MainProviderRepo {
  void init();
  void increment();
  void decrement();
}

class MainProvider with ChangeNotifier implements MainProviderRepo {
  MainProvider({required this.counter});
  int? counter;

  @override
  void decrement() {
    counter = counter! - 1;
    notifyListeners();
  }

  @override
  void increment() {
    counter = counter! + 1;
    notifyListeners();
  }

  @override
  void init() {
    counter = 200;
    notifyListeners();
  }
}
