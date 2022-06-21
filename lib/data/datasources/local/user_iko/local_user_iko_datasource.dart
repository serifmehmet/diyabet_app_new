import 'package:diyabet_app/data/datasources/local/models/user_iko_hive_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalUserIkoDataSource {
  Future<void> saveUserIko(UserIkoHiveModel userIkoToSave) async {
    final userIkoBox = Hive.box<UserIkoHiveModel>(UserIkoHiveModel.boxKey);

    await userIkoBox.add(userIkoToSave);
  }

  Future<List<UserIkoHiveModel?>> getUserIkoList(int userId) async {
    final userIkoBox = Hive.box<UserIkoHiveModel>(UserIkoHiveModel.boxKey);

    final userIkoList = userIkoBox.values.where((element) => element.userId == userId).toList();

    return userIkoList;
  }

  Future<UserIkoHiveModel> getSingleUserIko(int id) async {
    final userIkoBox = Hive.box<UserIkoHiveModel>(UserIkoHiveModel.boxKey);

    final singleUserIko = userIkoBox.values.singleWhere((element) => element.id == id);

    return singleUserIko;
  }

  Future<void> deleteSingleUserIko(int userIkoIdToDelete) async {
    final userIkoBox = Hive.box<UserIkoHiveModel>(UserIkoHiveModel.boxKey);

    final Map<dynamic, UserIkoHiveModel> userIkoMap = userIkoBox.toMap();

    dynamic keyToDelete;
    userIkoMap.forEach(
      (key, value) {
        if (value.id == userIkoIdToDelete) {
          keyToDelete = key;
        }
      },
    );

    await userIkoBox.delete(keyToDelete);
  }
}
