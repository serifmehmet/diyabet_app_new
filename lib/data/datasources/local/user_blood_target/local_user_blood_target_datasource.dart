import 'package:diyabet_app/data/datasources/local/models/user_blood_target_hive_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalUserBloodTargetDataSource {
  Future<void> saveUserBloodTarget(UserBloodTargetHiveModel userBloodTargetHiveModel) async {
    final userBTBox = Hive.box<UserBloodTargetHiveModel>(UserBloodTargetHiveModel.boxKey);
    if (userBTBox.values.isEmpty) {
      await userBTBox.add(userBloodTargetHiveModel);
    }
  }

  Future<UserBloodTargetHiveModel?> getUserBloodTarget(int userId) async {
    final userBTBox = Hive.box<UserBloodTargetHiveModel>(UserBloodTargetHiveModel.boxKey);

    final singleUserBT = userBTBox.values.singleWhere((element) => element.userId == userId);

    return singleUserBT;
  }

  Future<void> updateSingleUserBT(UserBloodTargetHiveModel userBTToUpdate) async {
    final userBTBox = Hive.box<UserBloodTargetHiveModel>(UserBloodTargetHiveModel.boxKey);

    final key = userBTBox.values.singleWhere((element) => element.userId == userBTToUpdate.userId).key;
    await userBTBox.putAt(key, userBTToUpdate);
  }
}
