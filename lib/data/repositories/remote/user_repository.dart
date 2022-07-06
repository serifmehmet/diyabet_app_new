import 'package:diyabet_app/data/datasources/remote/models/user/user_idf_model.dart';
import 'package:diyabet_app/data/datasources/remote/models/user/user_model.dart';
import 'package:diyabet_app/data/datasources/remote/user/user_idf_remote_datasource.dart';
import 'package:diyabet_app/data/datasources/remote/user/user_remote_datasource.dart';
import 'package:diyabet_app/domain/entities/user.dart';

abstract class UserRepository {
  Future<User?> login(String email, String password);
  Future<User?> register(UserModel userModel);
  Future<bool> addUserIdf(UserIdfModel userIdfModel);
}

class UserRepositoryImpl extends UserRepository {
  final UserRemoteDataSource userRemoteDataSource;
  final UserIdfRemoteDataSource userIdfRemoteDataSource;

  UserRepositoryImpl({required this.userRemoteDataSource, required this.userIdfRemoteDataSource});

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

  @override
  Future<bool> addUserIdf(UserIdfModel userIdfModel) async {
    final response = await userIdfRemoteDataSource.createUserIdf(userIdfModel);

    return response;
  }
}
