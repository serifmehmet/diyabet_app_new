import 'package:diyabet_app/domain/entities/user_idf.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'user_idf_hive_model.g.dart';

@HiveType(typeId: 7)
class UserIdfHiveModel extends HiveObject {
  static const String boxKey = "userIdfModel";

  @HiveField(0)
  late int id;
  @HiveField(1)
  late DateTime hour;
  @HiveField(2)
  late double idfValue;
  @HiveField(3)
  late int userId;

  UserIdf toEntity() => UserIdf(
        id: id,
        hour: hour,
        idfValue: idfValue,
        userId: userId,
      );
}
