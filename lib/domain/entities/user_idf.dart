import 'package:diyabet_app/data/datasources/local/models/user_idf_hive_model.dart';
import 'package:diyabet_app/data/datasources/remote/models/user/user_idf_model.dart';

class UserIdf {
  final int? id;
  final DateTime? hour;
  final double? idfValue;
  final int? userId;

  UserIdf({
    this.id,
    this.hour,
    this.idfValue,
    this.userId,
  });

  UserIdfHiveModel toHiveModel() => UserIdfHiveModel()
    ..id = id!
    ..hour = hour!
    ..idfValue = idfValue!
    ..userId = userId!;

  UserIdfModel toRemoteModel() => UserIdfModel(
        id: id,
        hour: hour,
        idfValue: idfValue,
        userId: userId,
      );
}
