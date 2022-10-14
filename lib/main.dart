import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_state_management/page/main_screen/main_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/home': (context) => const HomePage(
              text: '',
            ),
        '/other': (context) => const OtherView(),
        '/micro': (context) => MicrosoftView(),
        '/main': (context) => const MainScreen()
      },
      home: const MainScreen(),
    );
  }
}

class HomePage extends StatefulWidget {
  final String? text;
  const HomePage({super.key, required this.text});

  @override
  // ignore: no_logic_in_create_state
  State<HomePage> createState() {
    log("Home createState");
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  String? word = 'ok';
  String? textButton = 'ok';
  @override
  void initState() {
    log("Home initState");
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      log('HOME PAUSED');
    } else if (state == AppLifecycleState.inactive) {
      log('HOME INACTIVE');
    } else if (state == AppLifecycleState.resumed) {
      log('HOME RESUMED');
    } else if (state == AppLifecycleState.detached) {
      log('HOME DETACHED');
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void didChangeDependencies() {
    log("Home didChangeDependencies");
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant HomePage oldWidget) {
    if (oldWidget.text != widget.text) {
      log('Home did update Widget');
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    log("Home build");
    return Scaffold(
      appBar: AppBar(
        title: Text(word!),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const OtherView()));
              },
              icon: const Icon(Icons.arrow_forward),
            ),
            StatefulBuilder(builder: (context, setStateText) {
              log(textButton.toString());
              return TextButton(
                  onPressed: () {
                    textButton = 'Text';
                    setStateText(() {});
                  },
                  child: Text(textButton!));
            })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          word = 'Flutter g1';
          setState(() {});
        },
        child: const Icon(Icons.abc),
      ),
    );
  }

//? hot reloadda ishlaydi
  @override
  void reassemble() {
    log("Home ressamble");
    super.reassemble();
  }

  @override
  void deactivate() {
    log("Home deactive");
    super.deactivate();
  }

//? widgetdan chiqqanimizda ishlaydi
  @override
  void dispose() {
    log("Home dispose");
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}

class OtherView extends StatefulWidget {
  const OtherView({super.key});

  @override
  // ignore: no_logic_in_create_state
  State<OtherView> createState() {
    log("Other createState");
    return _OtherViewState();
  }
}

class _OtherViewState extends State<OtherView> {
  @override
  void initState() {
    log("Other initState");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    log("Other didChangeDependencies");
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    log("Other build");
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const HomePage(text: 'ok')));
          },
        ),
        title: const Text('Other'),
      ),
    );
  }

  @override
  void reassemble() {
    log("Other ressamble");
    super.reassemble();
  }

  @override
  void deactivate() {
    log("Other deactive");
    super.deactivate();
  }

  @override
  void dispose() {
    log("Other dispose");
    super.dispose();
  }
}

// ignore: must_be_immutable
class MicrosoftView extends StatelessWidget {
  String? text = 'hello';
  MicrosoftView({super.key});

  @override
  Widget build(BuildContext context) {
    log('MICRO BUILD');
    return Scaffold(
      body: Center(
        child: StatefulBuilder(builder: (context, setStateLocal) {
          log('MICRO STATEFUL BUILD');
          return TextButton(
              onPressed: () {
                text = 'Microsoft';
                setStateLocal(() {});
              },
              child: Text(text!));
        }),
      ),
    );
  }
}
