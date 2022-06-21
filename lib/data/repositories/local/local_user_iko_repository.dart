import 'package:diyabet_app/data/datasources/local/models/user_iko_hive_model.dart';
import 'package:diyabet_app/data/datasources/local/user_iko/local_user_iko_datasource.dart';
import 'package:diyabet_app/domain/entities/user_iko.dart';

abstract class LocalUserIkoRepository {
  Future<void> saveSingleUserIko(UserIkoHiveModel userIkoToSave);
  Future<List<UserIko>> getUserIkoList(int userId);
  Future<UserIko> getSingleUserIko(int userIkoId);
  Future<void> deleteSingleUserIko(int userIkoIdToDelete);
}

class LocalUserIkoRepositoryImpl extends LocalUserIkoRepository {
  final LocalUserIkoDataSource localUserIkoDataSource;

  LocalUserIkoRepositoryImpl({required this.localUserIkoDataSource});

  @override
  Future<void> deleteSingleUserIko(int userIkoIdToDelete) async {
    await localUserIkoDataSource.deleteSingleUserIko(userIkoIdToDelete);
  }

  @override
  Future<UserIko> getSingleUserIko(int userIkoId) async {
    final localUserIko = await localUserIkoDataSource.getSingleUserIko(userIkoId);
    final userIkoEntity = localUserIko.toEntity();
    return userIkoEntity;
  }

  @override
  Future<List<UserIko>> getUserIkoList(int userId) async {
    final localUserIkoList = await localUserIkoDataSource.getUserIkoList(userId);

    final userIkoList = localUserIkoList.map((e) => e!.toEntity()).toList();

    return userIkoList;
  }

  @override
  Future<void> saveSingleUserIko(UserIkoHiveModel userIkoToSave) async {
    await localUserIkoDataSource.saveUserIko(userIkoToSave);
  }
}
