// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_to_cache_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FoodToCacheHiveModelAdapter extends TypeAdapter<FoodToCacheHiveModel> {
  @override
  final int typeId = 6;

  @override
  FoodToCacheHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FoodToCacheHiveModel()
      ..id = fields[0] as int
      ..name = fields[1] as String
      ..isRecipe = fields[2] == null ? false : fields[2] as bool
      ..priority = fields[3] as int;
  }

  @override
  void write(BinaryWriter writer, FoodToCacheHiveModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.isRecipe)
      ..writeByte(3)
      ..write(obj.priority);
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
