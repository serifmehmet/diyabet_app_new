import 'package:diyabet_app/data/datasources/local/models/user_blood_target_hive_model.dart';

class UserBloodTarget {
  final int? id;
  final int? userId;

  ///Açlık Kan Şekeri
  final double? fbstValue;

  ///Gece Açlık Kan Şekeri
  final double? ofbgtValue;

  UserBloodTarget({
    this.id,
    this.userId,
    this.fbstValue,
    this.ofbgtValue,
  });

  UserBloodTargetHiveModel toHiveModel() => UserBloodTargetHiveModel()
    ..id = id!
    ..userId = userId!
    ..fbstValue = fbstValue!
    ..ofbgtValue = ofbgtValue!;
}
