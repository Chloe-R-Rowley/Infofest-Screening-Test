import 'package:flutter/material.dart';
import 'package:stray_dog/home_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;
  // static const List<Widget> _widgetOptions = <Widget>[
  //   Text(
  //     'Index 0: Home',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Index 1: Business',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Index 2: School',
  //     style: optionStyle,
  //   ),
  // ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  // final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

// @override
//   void dispose() {
//         SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
//     super.dispose();
//   }

//   @override
//   initState() {
//       SystemChrome.setEnabledSystemUIOverlays([]);
//     super.initState();
//   }

  @override
  Widget build(context) {
    return HomeScreen(
      onItemTapped: onItemTapped,
      selectedIndex: selectedIndex,
    );
  }
}
