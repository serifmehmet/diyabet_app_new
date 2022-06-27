// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_blood_target_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserBloodTargetHiveModelAdapter
    extends TypeAdapter<UserBloodTargetHiveModel> {
  @override
  final int typeId = 9;

  @override
  UserBloodTargetHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserBloodTargetHiveModel()
      ..id = fields[0] as int
      ..userId = fields[1] as int
      ..fbstValue = fields[2] as double
      ..pbgtValue = fields[3] as double
      ..ofbgtValue = fields[4] as double;
  }

  @override
  void write(BinaryWriter writer, UserBloodTargetHiveModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.fbstValue)
      ..writeByte(3)
      ..write(obj.pbgtValue)
      ..writeByte(4)
      ..write(obj.ofbgtValue);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserBloodTargetHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
