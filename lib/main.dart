// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'enums/colors.enums.dart';
import 'screens/home.page.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Fitness',
      theme: ThemeData(
        fontFamily: "Oswald",
        textTheme: TextTheme(
          headline1: TextStyle(
            color: WhiteColor,
            fontSize: 64,
          ),
          headline2: TextStyle(
            color: WhiteColor,
            fontSize: 48,
          ),
          bodyText2: TextStyle(
            color: WhiteColor,
            fontSize: 26,
          ),
        ),
      ),
      home: HomePage(),
      // home: CongratsPage(),
    );
  }
}
