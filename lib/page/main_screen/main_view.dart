import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_state_management/page/main_screen/main_provider.dart';
import 'package:flutter_state_management/page/sub/count_screen.dart';
import 'package:provider/provider.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  void initState() {
    //? Future.microtask(() => context.read<MainProvider>().init());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log('BUILD');
    final selectorMainCounter = context
        .select<MainProvider, int>((MainProvider mainPro) => mainPro.counter!);

    final selectIncrement = context.select<MainProvider, Function>(
        (mainProvider) => mainProvider.increment);

    final selectDecrement = context.select<MainProvider, Function>(
        (mainProvider) => mainProvider.decrement);

    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Page $selectorMainCounter'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                switchInCurve: Curves.bounceIn,
                transitionBuilder: (child, animation) => ScaleTransition(
                  scale: animation,
                  child: child,
                ),
                child: Text(
                  selectorMainCounter.toString(),
                  key: ValueKey<String>('count $selectorMainCounter'),
                  style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ),
              Consumer<String>(builder: (context, String count, _) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  switchInCurve: Curves.bounceIn,
                  transitionBuilder: (child, animation) => ScaleTransition(
                    scale: animation,
                    child: child,
                  ),
                  child: Text(
                    count,
                    key: ValueKey<String>('count $count'),
                    style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                );
              }),

              const CountScreen()

              // Consumer<int?>(builder: (context, int? count, _) {
              //   return AnimatedSwitcher(
              //     duration: const Duration(milliseconds: 300),
              //     switchInCurve: Curves.bounceIn,
              //     transitionBuilder: (child, animation) => ScaleTransition(
              //       scale: animation,
              //       child: child,
              //     ),
              //     child: Text(
              //       count.toString(),
              //       key: ValueKey<String>('count $count'),
              //       style: const TextStyle(
              //           fontSize: 40,
              //           fontWeight: FontWeight.bold,
              //           color: Colors.blue),
              //     ),
              //   );
              // }),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: '1',
            onPressed: () => selectIncrement(),
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            width: 20,
          ),
          FloatingActionButton(
            heroTag: '2',
            onPressed: () => selectDecrement(),
            child: const Icon(Icons.remove),
          )
        ],
      ),
    );
  }
}
