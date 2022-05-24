// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FoodHiveModelAdapter extends TypeAdapter<FoodHiveModel> {
  @override
  final int typeId = 2;

  @override
  FoodHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FoodHiveModel()
      ..id = fields[0] as int
      ..foodName = fields[1] as String
      ..unitType = fields[2] as String
      ..quantity = fields[3] as int
      ..carbTotal = fields[4] as double;
  }

  @override
  void write(BinaryWriter writer, FoodHiveModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.foodName)
      ..writeByte(2)
      ..write(obj.unitType)
      ..writeByte(3)
      ..write(obj.quantity)
      ..writeByte(4)
      ..write(obj.carbTotal);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FoodHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
