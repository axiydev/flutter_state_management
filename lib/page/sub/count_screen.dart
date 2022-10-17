import 'package:flutter/material.dart';
import 'package:flutter_state_management/page/sub/count_provider.dart';
import 'package:flutter_state_management/page/sub/count_view.dart';
import 'package:provider/provider.dart';

class CountScreen extends StatelessWidget {
  const CountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CountProvider>(
      create: (_) => CountProvider(),
      child: const CountView(),
    );
  }
}
