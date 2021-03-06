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

  GlobalKey changeCity = GlobalKey();
  GlobalKey search = GlobalKey();
  GlobalKey notifications = GlobalKey();
  GlobalKey connections = GlobalKey();
  GlobalKey alerts = GlobalKey();
  GlobalKey newsFeeds = GlobalKey();
  GlobalKey createPost = GlobalKey();
  GlobalKey reportPost = GlobalKey();
  GlobalKey petitionPost = GlobalKey();

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
        colorShadow: Colors.black,
        opacityShadow: 0.7,
        paddingFocus: 5,
        textStyleSkip: const TextStyle(
          color: Colors.orange,
          fontWeight: FontWeight.bold,
        ),
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
                description:
                    'Find people you know in your city by name and follow them'),
          ),
        ],
      ),
    );
    targets.add(
      TargetFocus(
        identify: 'Notifications',
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
        keyTarget: changeCity,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            child: TutorialContent(
                name: 'Change City',
                description:
                    'See News Feed from a different city by swiping left or right to change city'),
          ),
        ],
      ),
    );
    targets.add(
      TargetFocus(
        identify: 'Alerts',
        keyTarget: alerts,
        contents: [
          TargetContent(
            child: TutorialContent(
                name: 'Alerts',
                description:
                    'Stay updated on when you\'ll have load shedding and integrate load shedding schedule with your calendar.'),
          ),
        ],
      ),
    );
    targets.add(
      TargetFocus(
        identify: 'News Feed',
        keyTarget: newsFeeds,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            child: TutorialContent(
                name: 'News Feed',
                description:
                    'See reports, petition and announcements created near you.'),
          ),
        ],
      ),
    );
    targets.add(
      TargetFocus(
        identify: 'Announcement Post',
        keyTarget: createPost,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            child: TutorialContent(
                name: 'Announcement Post',
                description:
                    '- Get updated about what is happening in your area.\n- Create post to share issues related to your area.'),
          ),
        ],
      ),
    );
    targets.add(
      TargetFocus(
        identify: 'Post Reports you created',
        keyTarget: reportPost,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            child: TutorialContent(
                name: 'Post Reports you created',
                description:
                    'Share reports you created with people in your area'),
          ),
        ],
      ),
    );
    targets.add(
      TargetFocus(
        identify: 'Post Petitions you created',
        keyTarget: newsFeeds,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            child: TutorialContent(
                name: 'Post Petitions you created',
                description:
                    'Share petitions you created with people in your area.'),
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
            width: double.infinity,
            height: double.infinity,
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
            alignment: const Alignment(1.0, -0.9),
            child: SizedBox(
              height: 50,
              width: 50,
              key: connections,
            ),
          ),
          Align(
            alignment: const Alignment(0.75, -0.9),
            child: SizedBox(
              height: 50,
              width: 50,
              key: notifications,
            ),
          ),
          Align(
            alignment: const Alignment(0.55, -0.9),
            child: SizedBox(
              height: 50,
              width: 50,
              key: search,
            ),
          ),
          Align(
            alignment: const Alignment(0.025, -0.75),
            child: Expanded(
              flex: 1,
              child: SizedBox(
                height: 130,
                width: 130,
                key: changeCity,
              ),
            ),
          ),
          Align(
            alignment: const Alignment(-1.0, -0.425),
            child: Expanded(
              flex: 1,
              child: SizedBox(
                height: 120,
                width: 120,
                key: alerts,
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0.0, 0.75),
            child: Expanded(
              flex: 1,
              child: SizedBox(
                height: 470,
                width: double.infinity,
                key: newsFeeds,
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
        child: const Icon(Icons.navigate_next),
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
              fontWeight: FontWeight.bold, fontSize: 25.0, color: Colors.white),
        ),
        Text(
          description,
          style: const TextStyle(fontSize: 20.0, color: Colors.white),
        ),
      ],
    );
  }
}
