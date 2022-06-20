import 'package:diyabet_app/data/datasources/local/models/user_idf_hive_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalUserIdfLocalDataSource {
  Future<void> saveUserIdf(UserIdfHiveModel idfToSave) async {
    final userIdfBox = Hive.box<UserIdfHiveModel>(UserIdfHiveModel.boxKey);

    await userIdfBox.add(idfToSave);
  }

  Future<List<UserIdfHiveModel?>> getUserIdfList(int userId) async {
    final userIdfBox = Hive.box<UserIdfHiveModel>(UserIdfHiveModel.boxKey);

    final userIdfList = userIdfBox.values.where((element) => element.userId == userId).toList();

    return userIdfList;
  }

  Future<UserIdfHiveModel?> getSingleUserIdf(int id) async {
    final userIdfBox = Hive.box<UserIdfHiveModel>(UserIdfHiveModel.boxKey);

    final singleUserIdf = userIdfBox.values.singleWhere((element) => element.id == id);

    return singleUserIdf;
  }
}
