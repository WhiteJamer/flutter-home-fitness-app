import 'package:hive_flutter/adapters.dart';
import 'package:myapp/enums/program.enums.dart';
import 'package:myapp/models/program.model.dart';

class ProgramRepository {
  Future<List<Program>> getPrograms() async {
    try {
      await Hive.initFlutter();
      if (!Hive.isAdapterRegistered(0)) Hive.registerAdapter(ProgramAdapter());
      if (!Hive.isAdapterRegistered(2)) {
        Hive.registerAdapter(ExerciseTypeAdapter());
      }
    } catch (e) {
      print(e);
    }
    final box = await Hive.openBox('fitnessBox');
    final programs = await box.get("programs");

    return programs ?? [];
  }

  setPrograms(List<Program> programs) async {
    try {
      await Hive.initFlutter();
      if (!Hive.isAdapterRegistered(0)) Hive.registerAdapter(ProgramAdapter());
      if (!Hive.isAdapterRegistered(2)) {
        Hive.registerAdapter(ExerciseTypeAdapter());
      }
    } catch (e) {
      print(e);
    }
    final box = await Hive.deleteBoxFromDisk('fitnessBox');
  }
}
