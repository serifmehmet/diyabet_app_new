import 'package:diyabet_app/domain/entities/user_iko.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'user_iko_hive_model.g.dart';

@HiveType(typeId: 8)
class UserIkoHiveModel extends HiveObject {
  static const String boxKey = "userIkoModel";

  @HiveField(0)
  late int id;
  @HiveField(1)
  late DateTime hour;
  @HiveField(2)
  late double ikoValue;
  @HiveField(3)
  late int userId;

  UserIko toEntity() => UserIko(
        id: id,
        hour: hour,
        ikoValue: ikoValue,
        userId: userId,
      );
}
