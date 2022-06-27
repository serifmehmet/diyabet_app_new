import 'package:diyabet_app/data/datasources/local/models/user_blood_target_hive_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalUserBloodTargetDataSource {
  Future<void> saveUserBloodTarget(UserBloodTargetHiveModel userBloodTargetHiveModel) async {
    final userBTBox = Hive.box<UserBloodTargetHiveModel>(UserBloodTargetHiveModel.boxKey);

    await userBTBox.add(userBloodTargetHiveModel);
  }

  Future<UserBloodTargetHiveModel?> getUserBloodTarget(int userBTId) async {
    final userBTBox = Hive.box<UserBloodTargetHiveModel>(UserBloodTargetHiveModel.boxKey);

    final singleUserBT = userBTBox.values.singleWhere((element) => element.id == userBTId);

    return singleUserBT;
  }

  Future<void> updateSingleUserBT(UserBloodTargetHiveModel userBTToUpdate) async {
    final userBTBox = Hive.box<UserBloodTargetHiveModel>(UserBloodTargetHiveModel.boxKey);

    final key = userBTBox.values.singleWhere((element) => element.id == userBTToUpdate.id).key;
    await userBTBox.putAt(key, userBTToUpdate);
  }
}
