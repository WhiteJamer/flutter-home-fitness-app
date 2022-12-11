import 'package:hive_flutter/adapters.dart';
import 'package:myapp/enums/program.enums.dart';

part 'program.model.g.dart';

@HiveType(typeId: 0)
class Program extends HiveObject  {
  @HiveField(0)
  final int serialNumber;

  @HiveField(1)
  final ExerciseType type;

  @HiveField(2)
  final int interval; // in seconds

  @HiveField(3)
  final int times;

  @HiveField(4)
  final int quantity;

  Program(
      {required this.serialNumber,
      required this.type,
      required this.interval,
      required this.times,
      required this.quantity});
}
