import 'package:diyabet_app/data/datasources/local/models/user_iko_hive_model.dart';

class UserIko {
  final int? id;
  final DateTime? hour;
  final double? ikoValue;
  final int? userId;

  UserIko({
    this.id,
    this.hour,
    this.ikoValue,
    this.userId,
  });

  UserIkoHiveModel toHiveModel() => UserIkoHiveModel()
    ..id = id!
    ..hour = hour!
    ..ikoValue = ikoValue!
    ..userId = userId!;
}
