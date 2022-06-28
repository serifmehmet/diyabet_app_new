import 'package:diyabet_app/data/datasources/local/models/user_blood_target_hive_model.dart';

class UserBloodTarget {
  final int? id;
  final int? userId;

  ///Açlık Kan Şekeri
  final double? fbstValue;

  ///Tokluk Kan Şekeri
  final double? pbgtValue;

  ///Gece Açlık Kan Şekeri
  final double? ofbgtValue;

  UserBloodTarget({
    this.id,
    this.userId,
    this.fbstValue,
    this.pbgtValue,
    this.ofbgtValue,
  });

  UserBloodTargetHiveModel toHiveModel() => UserBloodTargetHiveModel()
    ..id = id!
    ..userId = userId!
    ..fbstValue = fbstValue!
    ..pbgtValue = pbgtValue!
    ..ofbgtValue = ofbgtValue!;
}
