// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'practice_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PracticeModelAdapter extends TypeAdapter<PracticeModel> {
  @override
  final int typeId = 3;

  @override
  PracticeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PracticeModel(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
      fields[5] as String,
      fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PracticeModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.display)
      ..writeByte(1)
      ..write(obj.foundationalTopicId)
      ..writeByte(2)
      ..write(obj.incorrectStreak)
      ..writeByte(3)
      ..write(obj.levels)
      ..writeByte(4)
      ..write(obj.streakCount)
      ..writeByte(5)
      ..write(obj.tName)
      ..writeByte(6)
      ..write(obj.topicId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PracticeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
