// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_iko_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserIkoHiveModelAdapter extends TypeAdapter<UserIkoHiveModel> {
  @override
  final int typeId = 8;

  @override
  UserIkoHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserIkoHiveModel()
      ..id = fields[0] as int
      ..hour = fields[1] as DateTime
      ..ikoValue = fields[2] as double
      ..userId = fields[3] as int;
  }

  @override
  void write(BinaryWriter writer, UserIkoHiveModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.hour)
      ..writeByte(2)
      ..write(obj.ikoValue)
      ..writeByte(3)
      ..write(obj.userId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserIkoHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
