import 'package:diyabet_app/core/base/error/app_exception.dart';
import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

import '../../../../core/base/model/generic_response_model.dart';
import '../../../../core/constants/enums/preferences_keys.dart';
import '../../../../core/init/cache/cache_manager.dart';
import '../models/user/user_blood_target_model.dart';

class UserBloodTargetRemoteDataSource {
  final NetworkManager networkManager;

  UserBloodTargetRemoteDataSource(this.networkManager);

  static const String endPointUrl = "/BloodTarget";

  Future<GenericResponseModel?> createUserBloodTarget(UserBloodTargetModel userBloodTargetModel) async {
    try {
      final response = await networkManager.send<GenericResponseModel, GenericResponseModel>(endPointUrl,
          parseModel: GenericResponseModel(),
          method: RequestType.POST,
          data: {"bloodTarget": userBloodTargetModel},
          options: Options(headers: {
            "X-Session-Id": CacheManager.instance.getStringValue(PreferencesKeys.X_SESSION_ID),
            "X-User-Id": CacheManager.instance.getIntValue(PreferencesKeys.USERID).toString(),
          }));

      if (response.error != null) {
        if (response.error!.statusCode == 401) throw const UnAuthorized();
      }

      return response.data!;
    } on DioError {
      return null;
    }
  }

  Future<bool> deleteRemoteUserBloodTarget(int userBTId) async {
    try {
      final response = await networkManager.send<GenericResponseModel, GenericResponseModel>(endPointUrl,
          parseModel: GenericResponseModel(),
          method: RequestType.DELETE,
          data: [userBTId],
          options: Options(headers: {
            "X-Session-Id": CacheManager.instance.getStringValue(PreferencesKeys.X_SESSION_ID),
            "X-User-Id": CacheManager.instance.getIntValue(PreferencesKeys.USERID).toString(),
          }));

      if (response.data!.errorCode == "OK") {
        return true;
      }

      return false;
    } catch (e) {
      debugPrint(e.toString());
    }

    return false;
  }

  Future<GenericResponseModel?> updateRemoteUserBloodTarget(UserBloodTargetModel userBloodTargetModel) async {
    try {
      final response = await networkManager.send<GenericResponseModel, GenericResponseModel>(
        endPointUrl,
        parseModel: GenericResponseModel(),
        method: RequestType.PUT,
        data: {"bloodTarget": userBloodTargetModel},
        options: Options(
          headers: {
            "X-Session-Id": CacheManager.instance.getStringValue(PreferencesKeys.X_SESSION_ID),
            "X-User-Id": CacheManager.instance.getIntValue(PreferencesKeys.USERID).toString(),
          },
        ),
      );

      if (response.error != null) {
        if (response.error!.statusCode == 401) {
          throw const UnAuthorized();
        }
      }

      return response.data!;
    } on DioError {
      return null;
    }
  }
}
