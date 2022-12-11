// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program.model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProgramAdapter extends TypeAdapter<Program> {
  @override
  final int typeId = 0;

  @override
  Program read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Program(
      serialNumber: fields[0] as int,
      type: fields[1] as ExerciseType,
      interval: fields[2] as int,
      times: fields[3] as int,
      quantity: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Program obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.serialNumber)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.interval)
      ..writeByte(3)
      ..write(obj.times)
      ..writeByte(4)
      ..write(obj.quantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProgramAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
