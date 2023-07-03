// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consumption_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ConsumptionHiveModelAdapter extends TypeAdapter<ConsumptionHiveModel> {
  @override
  final int typeId = 2;

  @override
  ConsumptionHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ConsumptionHiveModel()
      ..id = fields[0] as int
      ..name = fields[1] as String
      ..unitType = fields[2] as String
      ..quantity = fields[3] as int
      ..carbTotal = fields[4] as double
      ..index = fields[5] as int
      ..unitId = fields[7] as int
      ..consumptionType = fields[8] as int;
  }

  @override
  void write(BinaryWriter writer, ConsumptionHiveModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.unitType)
      ..writeByte(3)
      ..write(obj.quantity)
      ..writeByte(4)
      ..write(obj.carbTotal)
      ..writeByte(5)
      ..write(obj.index)
      ..writeByte(7)
      ..write(obj.unitId)
      ..writeByte(8)
      ..write(obj.consumptionType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConsumptionHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
