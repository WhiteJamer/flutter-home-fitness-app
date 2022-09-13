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
            fontSize: 42,
          ),
          bodyText2: TextStyle(
            color: WhiteColor,
            fontSize: 48,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            textStyle: TextStyle(fontSize: 30, letterSpacing: 0),
            padding: EdgeInsets.symmetric(vertical: 32, horizontal: 22),
            primary: BackgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(11)),
              side: BorderSide(
                width: 4.0,
                color: PrimaryColor,
              ),
            ),
          ),
        ),
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
