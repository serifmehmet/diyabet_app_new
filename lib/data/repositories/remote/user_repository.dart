import 'package:diyabet_app/data/datasources/remote/models/user_model.dart';
import 'package:diyabet_app/data/datasources/remote/user/user_remote_datasource.dart';
import 'package:diyabet_app/domain/entities/user.dart';

abstract class UserRepository {
  Future<User?> login(String email, String password);
  Future<User?> register(UserModel userModel);
}

class UserRepositoryImpl extends UserRepository {
  final UserRemoteDataSource userRemoteDataSource;

  UserRepositoryImpl({required this.userRemoteDataSource});

  @override
  Future<User?> login(String email, String password) async {
    final userModel = await userRemoteDataSource.userLogin(email, password);

    if (userModel == null) return null;

    final user = userModel.toEntity();

    return user;
  }

  @override
  Future<User?> register(UserModel? usrModel) async {
    final userModel = await userRemoteDataSource.userRegister(usrModel!);

    return userModel!.toEntity();
  }
}
