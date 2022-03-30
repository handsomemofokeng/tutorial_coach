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
            child: Column(
              children: const [
                Text(
                  'Search',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      color: Colors.black),
                ),
                Text(
                  'This is a Search menu option...',
                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                ),
              ],
            ),
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
            child: Column(
              children: const [
                Text(
                  'Notifications',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      color: Colors.black),
                ),
                Text(
                  'I wonder how I am going to incorporate this in a Native '
                  'Platform seamlessly without having to recreate the screens '
                  'in in Flutter... Man I hope it\'s not gonna be a mission ',
                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                ),
              ],
            ),
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
            child: Column(
              children: const [
                Text(
                  'Connections',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      color: Colors.black),
                ),
                Text(
                  'I wonder how I am going to incorporate this in a Native '
                  'Platform seamlessly without having to recreate the screens '
                  'in in Flutter... Man I hope it\'s not gonna be a mission ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    targets.add(
      TargetFocus(
        identify: 'Feature 1',
        keyTarget: key1,
        contents: [
          TargetContent(
            child: Column(
              children: const [
                Text(
                  'Feature 1',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      color: Colors.black),
                ),
                Text(
                  'I wonder how I am going to incorporate this in a Native '
                  'Platform seamlessly without having to recreate the screens '
                  'in in Flutter... Man I hope it\'s not gonna be a mission ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        leading: Icon(
          Icons.arrow_back_ios,
          key: back,
        ),
        actions: [
          Icon(
            Icons.search,
            key: search,
          ),
          const SizedBox(width: 10.0),
          Icon(
            Icons.notifications,
            key: notifications,
          ),
          const SizedBox(width: 10.0),
          Icon(
            Icons.group,
            key: connections,
          ),
          const SizedBox(width: 10.0),
        ],
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 50.0),
            Container(
              child: Text(
                '1',
                style: Theme.of(context).textTheme.headline4,
                key: key1,
              ),
            ),
            const SizedBox(height: 50.0),
            Container(
              child: Text(
                '2',
                style: Theme.of(context).textTheme.headline4,
                key: key2,
              ),
            ),
            const SizedBox(height: 50.0),
            Container(
              child: Text(
                '3',
                style: Theme.of(context).textTheme.headline4,
                key: key3,
              ),
            ),
          ],
        ),
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
}
