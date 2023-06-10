// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task1.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class Task1Adapter extends TypeAdapter<Task1> {
  @override
  final int typeId = 0;

  @override
  Task1 read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Task1(
      name: fields[0] as String,
      isDone: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Task1 obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.isDone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Task1Adapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
