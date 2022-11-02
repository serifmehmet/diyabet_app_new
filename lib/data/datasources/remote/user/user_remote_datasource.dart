import 'package:diyabet_app/core/base/model/generic_response_model.dart';
import 'package:diyabet_app/data/datasources/remote/models/user/user_model.dart';
import 'package:vexana/vexana.dart';

import '../../../../core/constants/enums/preferences_keys.dart';
import '../../../../core/init/cache/cache_manager.dart';

class UserRemoteDataSource {
  static const String loginUrl = "/login";
  static const String registerUrl = '/register';
  static const String updateUrl = '/UpdateUser';

  final NetworkManager networkManager;

  UserRemoteDataSource(this.networkManager);

  Future<UserModel?> userLogin(String email, String password) async {
    final response = await networkManager.post(
      loginUrl,
      data: {"userId": email, "password": password},
    );
    UserModel? userModel;
    if (response.statusCode == 200) {
      userModel = UserModel.fromJson(response.data);
      if (userModel.errorCode == "OK") {
        String? sessionId = response.headers["X-Session-Id"]!.first.toString();
        userModel.xSessionId = sessionId;
      }
    }

    return userModel;
  }

  Future<GenericResponseModel?> userRegister(UserModel? userModel) async {
    final response = await networkManager.send<GenericResponseModel, GenericResponseModel>(
      registerUrl,
      parseModel: GenericResponseModel(),
      method: RequestType.POST,
      data: userModel,
    );

    return response.data;
  }

  Future<GenericResponseModel> updateUserInfo(int userId, String name, String surName, String password) async {
    final response = await networkManager.send<GenericResponseModel, GenericResponseModel>(
      updateUrl,
      parseModel: GenericResponseModel(),
      method: RequestType.POST,
      data: {
        'UserId': userId,
        'Name': name,
        'SurName': surName,
        'Password': password,
      },
      options: Options(
        headers: {
          "X-Session-Id": CacheManager.instance.getStringValue(PreferencesKeys.X_SESSION_ID),
          "X-User-Id": CacheManager.instance.getIntValue(PreferencesKeys.USERID).toString(),
        },
      ),
    );

    return response.data!;
  }
}
