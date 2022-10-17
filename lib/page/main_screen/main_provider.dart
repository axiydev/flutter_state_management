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

  Stream<String> get otherCount async* {
    var other = 0;
    while (other <= 30) {
      await Future.delayed(const Duration(seconds: 1));
      other = other + 1;
      yield other.toString();
    }
  }
}

class AdditionalData {
  static Future<int?> get getCount async {
    final data = await Future.delayed(const Duration(seconds: 10))
        .then((value) => 10000);
    return data;
  }
}
