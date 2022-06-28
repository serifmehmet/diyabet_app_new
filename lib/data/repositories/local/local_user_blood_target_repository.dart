import 'package:diyabet_app/data/datasources/local/models/user_blood_target_hive_model.dart';
import 'package:diyabet_app/data/datasources/local/user_blood_target/local_user_blood_target_datasource.dart';
import 'package:diyabet_app/domain/entities/user_blood_target.dart';

abstract class LocalUserBloodTargetRepository {
  Future<void> saveUserBloodTarget(UserBloodTargetHiveModel userBloodTargetToSave);
  Future<UserBloodTarget> getSingleUserBloodTarget(int userId);
  Future<void> updateSingleUserBloodTarget(UserBloodTargetHiveModel userBloodTargetToUpdate);
}

class LocalUserBloodTargetRepositoryImpl extends LocalUserBloodTargetRepository {
  final LocalUserBloodTargetDataSource localUserBloodTargetDataSource;

  LocalUserBloodTargetRepositoryImpl({required this.localUserBloodTargetDataSource});

  @override
  Future<UserBloodTarget> getSingleUserBloodTarget(int userId) async {
    final localUserBT = await localUserBloodTargetDataSource.getUserBloodTarget(userId);

    return localUserBT!.toEntity();
  }

  @override
  Future<void> saveUserBloodTarget(UserBloodTargetHiveModel userBloodTargetToSave) async {
    await localUserBloodTargetDataSource.saveUserBloodTarget(userBloodTargetToSave);
  }

  @override
  Future<void> updateSingleUserBloodTarget(UserBloodTargetHiveModel userBloodTargetToUpdate) async {
    await localUserBloodTargetDataSource.updateSingleUserBT(userBloodTargetToUpdate);
  }
}
