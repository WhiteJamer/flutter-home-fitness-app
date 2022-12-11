import 'package:hive/hive.dart';
import 'package:myapp/models/program.model.dart';

part 'history.model.g.dart';

@HiveType(typeId: 1)
class History extends HiveObject {
  @HiveField(0)
  final int? quantity;

  @HiveField(1)
  final int repeats;

  @HiveField(2)
  final Program program;

  History({this.quantity, required this.repeats, required this.program});
}
