import 'package:diyabet_app/data/datasources/local/models/user_hive_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class LocalUserRepository {
  Future<void> saveUser(UserHiveModel usrHiveModel, String key);
  Future<UserHiveModel?> getUser(String number);
}

class LocalUserRepositoryImpl extends LocalUserRepository {
  @override
  Future<UserHiveModel?> getUser(String number) async {
    final userBox = Hive.box<UserHiveModel>(UserHiveModel.boxKey);

    return userBox.get(number);
  }

  @override
  Future<void> saveUser(UserHiveModel usrHiveModel, String key) async {
    final userBox = Hive.box<UserHiveModel>(UserHiveModel.boxKey);

    await userBox.put(key, usrHiveModel);
  }
}
