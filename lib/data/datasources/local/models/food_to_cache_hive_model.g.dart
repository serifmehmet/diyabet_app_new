// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_to_cache_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FoodToCacheHiveModelAdapter extends TypeAdapter<FoodToCacheHiveModel> {
  @override
  final int typeId = 4;

  @override
  FoodToCacheHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FoodToCacheHiveModel()
      ..id = fields[0] as double
      ..name = fields[1] as String;
  }

  @override
  void write(BinaryWriter writer, FoodToCacheHiveModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FoodToCacheHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
