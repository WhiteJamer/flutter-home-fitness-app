import 'package:flutter/material.dart';

class TimesOptionModel {
  final String name;
  final int value;
  const TimesOptionModel({Key? key, required this.name, required this.value});
}

class TimeFieldOptionModel {
  final String name;
  final int seconds;
  final String suffixText;

  TimeFieldOptionModel(
      {required this.name, required this.seconds, required this.suffixText});
}
