import 'package:diyabet_app/domain/entities/user_blood_target.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'user_blood_target_hive_model.g.dart';

@HiveType(typeId: 9)
class UserBloodTargetHiveModel extends HiveObject {
  static const String boxKey = "userBloodTargetModel";

  @HiveField(0)
  late int id;
  @HiveField(1)
  late int userId;
  @HiveField(2)
  late double fbstValue;

  @HiveField(4)
  late double ofbgtValue;

  UserBloodTarget toEntity() => UserBloodTarget(
        id: id,
        userId: userId,
        fbstValue: fbstValue,
        ofbgtValue: ofbgtValue,
      );
}
