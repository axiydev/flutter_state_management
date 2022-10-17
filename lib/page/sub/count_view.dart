import 'package:flutter/material.dart';
import 'package:flutter_state_management/page/main_screen/main_provider.dart';
import 'package:flutter_state_management/page/sub/count_provider.dart';
import 'package:provider/provider.dart';

class CountView extends StatefulWidget {
  const CountView({super.key});

  @override
  State<CountView> createState() => _CountViewState();
}

class _CountViewState extends State<CountView> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<CountProvider, MainProvider>(
        builder: (context, counterPro, mainPro, _) {
      return TextButton(
        onPressed: () {
          counterPro.increment();
          mainPro.increment();
        },
        child: Text(
          counterPro.countInCounter.toString(),
          style: const TextStyle(
              fontSize: 30, color: Colors.red, fontWeight: FontWeight.bold),
        ),
      );
    });
  }
}
