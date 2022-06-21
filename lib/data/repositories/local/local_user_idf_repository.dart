import 'package:diyabet_app/data/datasources/local/models/user_idf_hive_model.dart';
import 'package:diyabet_app/data/datasources/local/user_idf/local_user_idf_datasource.dart';
import 'package:diyabet_app/domain/entities/user_idf.dart';

abstract class LocalUserIdfRepository {
  Future<void> saveSingleUserIdf(UserIdfHiveModel userIdfToSave);
  Future<List<UserIdf>> getUserIdfList(int userId);
  Future<UserIdf> getSingleUserIdf(int userIdfId);
  Future<void> deleteSingleUserIdf(int userIdfId);
}

class LocalUserIdfRepositoryImpl extends LocalUserIdfRepository {
  final LocalUserIdfLocalDataSource localUserIdfLocalDataSource;

  LocalUserIdfRepositoryImpl({required this.localUserIdfLocalDataSource});

  @override
  Future<UserIdf> getSingleUserIdf(int userIdfId) async {
    final localUserIdf = await localUserIdfLocalDataSource.getSingleUserIdf(userIdfId);
    final userIdfEntity = localUserIdf!.toEntity();
    return userIdfEntity;
  }

  @override
  Future<List<UserIdf>> getUserIdfList(int userId) async {
    final localUserIdfList = await localUserIdfLocalDataSource.getUserIdfList(userId);

    final userIdfList = localUserIdfList.map((e) => e!.toEntity()).toList();

    return userIdfList;
  }

  @override
  Future<void> saveSingleUserIdf(UserIdfHiveModel userIdfToSave) async {
    await localUserIdfLocalDataSource.saveUserIdf(userIdfToSave);
  }

  @override
  Future<void> deleteSingleUserIdf(int userIdfId) async {
    await localUserIdfLocalDataSource.deleteSingleUserIdf(userIdfId);
  }
}
