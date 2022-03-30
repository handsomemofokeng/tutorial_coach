import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TutorialCoachMark tutorialCoachMark;
  List<TargetFocus> targets = [];

  GlobalKey back = GlobalKey();
  GlobalKey search = GlobalKey();
  GlobalKey notifications = GlobalKey();
  GlobalKey connections = GlobalKey();
  GlobalKey key1 = GlobalKey();
  GlobalKey key2 = GlobalKey();
  GlobalKey key3 = GlobalKey();

  @override
  void initState() {
    initTarget();
    WidgetsBinding.instance?.addPostFrameCallback(_afterLayout);
    super.initState();
  }

  void _afterLayout(_) {
    Future.delayed(const Duration(milliseconds: 100));
    showTutorial();
  }

  void showTutorial() {
    tutorialCoachMark = TutorialCoachMark(context,
        targets: targets,
        colorShadow: Colors.orange,
        opacityShadow: 0.7,
        paddingFocus: 5,
        alignSkip: Alignment.bottomCenter)
      ..show();
  }

  void initTarget() {
    targets.add(
      TargetFocus(
        identify: 'Menu',
        keyTarget: search,
        contents: [
          TargetContent(
            child: TutorialContent(
                name: 'Search',
                description: 'Hello world generating some random text on this'),
          ),
        ],
      ),
    );
    targets.add(
      TargetFocus(
        identify: 'Feature 1',
        keyTarget: notifications,
        contents: [
          TargetContent(
            child: TutorialContent(
                name: 'Notifications',
                description: 'Hello world generating some random text on this'),
          ),
        ],
      ),
    );
    targets.add(
      TargetFocus(
        identify: 'Connections',
        keyTarget: connections,
        contents: [
          TargetContent(
            child: TutorialContent(
                name: 'Connections',
                description: 'Hello world generating some random text on this'),
          ),
        ],
      ),
    );
    targets.add(
      TargetFocus(
        identify: 'Change City',
        keyTarget: key1,
        contents: [
          TargetContent(
            child: TutorialContent(
                name: 'Change City',
                description: 'Hello world generating some random text on this'),
          ),
        ],
      ),
    );
    targets.add(
      TargetFocus(
        identify: 'Alerts',
        keyTarget: key2,
        contents: [
          TargetContent(
            child: TutorialContent(
                name: 'Alerts',
                description: 'Hello world generating some random text on this'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   // Here we take the value from the MyHomePage object that was created by
      //   // the App.build method, and use it to set our appbar title.
      //   title: Text(widget.title),
      //   leading: Icon(
      //     Icons.arrow_back_ios,
      //     key: back,
      //   ),
      //   actions: [
      //     Icon(
      //       Icons.search,
      //       key: search,
      //     ),
      //     const SizedBox(width: 10.0),
      //     Icon(
      //       Icons.notifications,
      //       key: notifications,
      //     ),
      //     const SizedBox(width: 10.0),
      //     Icon(
      //       Icons.group,
      //       key: connections,
      //     ),
      //     const SizedBox(width: 10.0),
      //   ],
      // ),
      body: Stack(
        children: <Widget>[
          Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'images/tutorial_screen.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Container(
          //   width: double.infinity,
          //   height: double.infinity,
          //   constraints: const BoxConstraints.expand(),
          //   decoration: const BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage('images/tutorial_screen.png'),
          //       fit: BoxFit.fitWidth,
          //     ),
          //   ),
          // ),

          Align(
            alignment: const Alignment(1.0, -0.95),
            child: SizedBox(
              height: 50,
              width: 50,
              key: connections,
            ),
          ),
          Align(
            alignment: const Alignment(0.75, -0.95),
            child: SizedBox(
              height: 50,
              width: 50,
              key: notifications,
            ),
          ),
          Align(
            alignment: const Alignment(0.5, -0.95),
            child: SizedBox(
              height: 50,
              width: 50,
              key: search,
            ),
          ),
          Align(
            alignment: const Alignment(0.0, -0.75),
            child: Expanded(
              flex: 1,
              child: SizedBox(
                height: 50,
                width: 250,
                key: key1,
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0.0, -0.55),
            child: Expanded(
              flex: 1,
              child: SizedBox(
                height: 50,
                width: 250,
                key: key2,
              ),
            ),
          ),

          // Column(
          //   children: [
          //     Row(
          //       children: [
          //         Container(
          //           height: 50,
          //           width: 50,
          //           color: Colors.red,
          //           alignment: Alignment.topLeft,
          //         ),
          //         Container(
          //           height: 50,
          //           width: 50,
          //           color: Colors.blue,
          //           alignment: Alignment.topLeft,
          //         ),
          //       ],
          //     ),
          //   ],
          // ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showTutorial();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Size displaySize(BuildContext context) {
    debugPrint('Size = ' + MediaQuery.of(context).size.toString());
    return MediaQuery.of(context).size;
  }

  double displayHeight(BuildContext context) {
    debugPrint('Height = ' + displaySize(context).height.toString());
    return displaySize(context).height;
  }

  double displayWidth(BuildContext context) {
    debugPrint('Width = ' + displaySize(context).width.toString());
    return displaySize(context).width;
  }
}

class TutorialContent extends StatelessWidget {
  String name, description;

  TutorialContent({required this.name, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          name,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25.0, color: Colors.black),
        ),
        Text(
          description,
          style: const TextStyle(fontSize: 20.0, color: Colors.black),
        ),
      ],
    );
  }
}
