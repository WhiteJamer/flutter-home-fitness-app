import 'package:hive_flutter/hive_flutter.dart';

part 'program.enums.g.dart';

@HiveType(typeId: 2)
enum ExerciseType { 
  @HiveField(0)
  PullUps, 
  @HiveField(1)
  PushUps, 
  @HiveField(2)
  SwiningThePress }
