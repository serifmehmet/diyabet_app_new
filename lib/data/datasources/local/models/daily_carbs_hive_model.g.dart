// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_carbs_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DailyCarbsHiveModelAdapter extends TypeAdapter<DailyCarbsHiveModel> {
  @override
  final int typeId = 1;

  @override
  DailyCarbsHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DailyCarbsHiveModel()
      ..foodsAdded = (fields[1] as List).cast<FoodHiveModel>()
      ..totalCarbs = fields[2] as double;
  }

  @override
  void write(BinaryWriter writer, DailyCarbsHiveModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.foodsAdded)
      ..writeByte(2)
      ..write(obj.totalCarbs);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DailyCarbsHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
