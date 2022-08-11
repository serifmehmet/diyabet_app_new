// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_idf_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserIdfHiveModelAdapter extends TypeAdapter<UserIdfHiveModel> {
  @override
  final int typeId = 7;

  @override
  UserIdfHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserIdfHiveModel()
      ..id = fields[0] as int
      ..hour = fields[1] as DateTime
      ..idfValue = fields[2] as double
      ..userId = fields[3] as int;
  }

  @override
  void write(BinaryWriter writer, UserIdfHiveModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.hour)
      ..writeByte(2)
      ..write(obj.idfValue)
      ..writeByte(3)
      ..write(obj.userId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserIdfHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
