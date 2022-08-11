// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_receipt_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalRecieptHiveModelAdapter extends TypeAdapter<LocalRecieptHiveModel> {
  @override
  final int typeId = 10;

  @override
  LocalRecieptHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalRecieptHiveModel()
      ..id = fields[0] as int
      ..foodList = (fields[1] as List).cast<FoodHiveModel>()
      ..receiptName = fields[2] as String
      ..isApproved = fields[3] as bool
      ..portionQunatity = fields[4] as int
      ..createdDate = fields[5] as DateTime;
  }

  @override
  void write(BinaryWriter writer, LocalRecieptHiveModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.foodList)
      ..writeByte(2)
      ..write(obj.receiptName)
      ..writeByte(3)
      ..write(obj.isApproved)
      ..writeByte(4)
      ..write(obj.portionQunatity)
      ..writeByte(5)
      ..write(obj.createdDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalRecieptHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
