import 'package:flutter/material.dart';

class CountProvider with ChangeNotifier {
  int countInCounter = 0;
  void increment() {
    countInCounter++;
    notifyListeners();
  }

  void decrement() {
    countInCounter--;
    notifyListeners();
  }
}
