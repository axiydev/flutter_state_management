import 'package:flutter/material.dart';
import 'package:flutter_state_management/page/main_screen/main_provider.dart';
import 'package:flutter_state_management/page/main_screen/main_view.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainProvider>(
      create: (_) => MainProvider(counter: 121),
      lazy: false,
      child: const MainView(),
    );
  }
}
