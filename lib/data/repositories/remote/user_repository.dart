import 'package:dartz/dartz.dart';
import 'package:diyabet_app/core/base/error/failure.dart';
import 'package:diyabet_app/core/base/model/generic_response_model.dart';
import 'package:diyabet_app/data/datasources/remote/models/user/user_blood_target_model.dart';
import 'package:diyabet_app/data/datasources/remote/models/user/user_bolus_model.dart';
import 'package:diyabet_app/data/datasources/remote/models/user/user_idf_model.dart';
import 'package:diyabet_app/data/datasources/remote/models/user/user_iko_model.dart';
import 'package:diyabet_app/data/datasources/remote/models/user/user_model.dart';
import 'package:diyabet_app/data/datasources/remote/user/user_bloodtarget_remote_datasource.dart';
import 'package:diyabet_app/data/datasources/remote/user/user_bolus_remote_datasource.dart';
import 'package:diyabet_app/data/datasources/remote/user/user_idf_remote_datasource.dart';
import 'package:diyabet_app/data/datasources/remote/user/user_iko_remote_datasource.dart';
import 'package:diyabet_app/data/datasources/remote/user/user_remote_datasource.dart';
import 'package:diyabet_app/domain/entities/generic_response.dart';
import 'package:diyabet_app/domain/entities/user.dart';

import '../../../core/base/error/app_exception.dart';

abstract class UserRepository {
  Future<User?> login(String email, String password);
  Future<GenericResponse> register(UserModel userModel);
  Future<bool> addUserIdf(UserIdfModel userIdfModel);
  Future<bool> deleteUserIdf(int userIdfId);
  Future<bool> addUserIko(UserIkoModel userIkoModel);
  Future<bool> deleteUserIko(int userIkoId);
  Future<Either<Failure, GenericResponse>> addUserBloodTarget(UserBloodTargetModel userBloodTargetModel);
  Future<Either<Failure, GenericResponse>> updateUserBloodTarget(UserBloodTargetModel userBloodTargetModel);
  Future<GenericResponseModel> updateUserInfo(int userId, String name, String surName, String password);
  Future<GenericResponse> resetPassword(String email, String password);

  //UserBolus
  Future<GenericResponseModel> saveCalculatedUserBolus(int mealId, UserBolusModel userBolusModel);
}

class UserRepositoryImpl extends UserRepository {
  final UserRemoteDataSource userRemoteDataSource;
  final UserIdfRemoteDataSource userIdfRemoteDataSource;
  final UserIkoRemoteDataSource userIkoRemoteDataSource;
  final UserBloodTargetRemoteDataSource userBloodTargetRemoteDataSource;
  final UserBolusRemoteDataSource userBolusRemoteDataSource;

  UserRepositoryImpl({
    required this.userRemoteDataSource,
    required this.userIdfRemoteDataSource,
    required this.userIkoRemoteDataSource,
    required this.userBloodTargetRemoteDataSource,
    required this.userBolusRemoteDataSource,
  });

  @override
  Future<User?> login(String email, String password) async {
    final userModel = await userRemoteDataSource.userLogin(email, password);

    if (userModel == null) return null;

    final user = userModel.toEntity();

    return user;
  }

  @override
  Future<GenericResponse> register(UserModel? usrModel) async {
    final response = await userRemoteDataSource.userRegister(usrModel!);

    return response!.toEntity();
  }

  @override
  Future<bool> addUserIdf(UserIdfModel userIdfModel) async {
    final response = await userIdfRemoteDataSource.createUserIdf(userIdfModel);

    return response;
  }

  @override
  Future<bool> deleteUserIdf(int userIdfId) async {
    final response = await userIdfRemoteDataSource.deleteRemoteUserIdf(userIdfId);

    return response;
  }

  @override
  Future<bool> addUserIko(UserIkoModel userIkoModel) async {
    final response = await userIkoRemoteDataSource.createUserIko(userIkoModel);

    return response;
  }

  @override
  Future<bool> deleteUserIko(int userIkoId) async {
    final response = await userIkoRemoteDataSource.deleteRemoteUserIko(userIkoId);

    return response;
  }

  @override
  Future<Either<Failure, GenericResponse>> addUserBloodTarget(UserBloodTargetModel userBloodTargetModel) async {
    try {
      final response = await userBloodTargetRemoteDataSource.createUserBloodTarget(userBloodTargetModel);

      return Right(response!.toEntity());
    } on UnAuthorized {
      return const Left(UnAuthorizedError());
    }
  }

  @override
  Future<Either<Failure, GenericResponse>> updateUserBloodTarget(UserBloodTargetModel userBloodTargetModel) async {
    try {
      final response = await userBloodTargetRemoteDataSource.updateRemoteUserBloodTarget(userBloodTargetModel);

      return Right(response!.toEntity());
    } on UnAuthorized {
      return const Left(UnAuthorizedError());
    }
  }

  @override
  Future<GenericResponseModel> saveCalculatedUserBolus(int mealId, UserBolusModel userBolusModel) async {
    final response = await userBolusRemoteDataSource.saveCalculatedBolusValue(userBolusModel, mealId);

    return response;
  }

  @override
  Future<GenericResponseModel> updateUserInfo(int userId, String name, String surName, String password) async {
    final response = await userRemoteDataSource.updateUserInfo(userId, name, surName, password);

    return response;
  }

  @override
  Future<GenericResponse> resetPassword(String email, String password) async {
    final response = await userRemoteDataSource.resetPassword(email, password);

    return response.toEntity();
  }
}
