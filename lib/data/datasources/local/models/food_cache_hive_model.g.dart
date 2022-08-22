// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_cache_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FoodCacheHiveModelAdapter extends TypeAdapter<FoodCacheHiveModel> {
  @override
  final int typeId = 5;

  @override
  FoodCacheHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FoodCacheHiveModel()
      ..foodList = (fields[0] as List).cast<FoodToCacheHiveModel>()
      ..errorCode = fields[1] as String;
  }

  @override
  void write(BinaryWriter writer, FoodCacheHiveModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.foodList)
      ..writeByte(1)
      ..write(obj.errorCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FoodCacheHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
