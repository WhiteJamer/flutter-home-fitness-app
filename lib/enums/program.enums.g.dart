// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program.enums.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExerciseTypeAdapter extends TypeAdapter<ExerciseType> {
  @override
  final int typeId = 2;

  @override
  ExerciseType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ExerciseType.PullUps;
      case 1:
        return ExerciseType.PushUps;
      case 2:
        return ExerciseType.SwiningThePress;
      default:
        return ExerciseType.PullUps;
    }
  }

  @override
  void write(BinaryWriter writer, ExerciseType obj) {
    switch (obj) {
      case ExerciseType.PullUps:
        writer.writeByte(0);
        break;
      case ExerciseType.PushUps:
        writer.writeByte(1);
        break;
      case ExerciseType.SwiningThePress:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExerciseTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
