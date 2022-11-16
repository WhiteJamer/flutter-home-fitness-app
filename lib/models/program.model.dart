import 'package:myapp/enums/program.enums.dart';

class Program{
  final ExerciseType type;
  final double interval; // in minutes
  final int quantity;

  Program({required this.type, required this.interval, required this.quantity});
}