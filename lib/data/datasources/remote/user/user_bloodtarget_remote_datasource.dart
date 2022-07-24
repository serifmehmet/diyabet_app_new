import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

import '../../../../core/base/model/generic_response_model.dart';
import '../models/user/user_blood_target_model.dart';

class UserBloodTargetRemoteDataSource {
  final NetworkManager networkManager;

  UserBloodTargetRemoteDataSource(this.networkManager);

  static const String endPointUrl = "/BloodTarget";

  Future<bool> createUserBloodTarget(UserBloodTargetModel userBloodTargetModel) async {
    try {
      final response = await networkManager.send<GenericResponseModel, GenericResponseModel>(
        endPointUrl,
        parseModel: GenericResponseModel(),
        method: RequestType.POST,
        data: {"bloodTarget": userBloodTargetModel},
      );

      if (response.data!.errorCode == "OK") {
        return true;
      }

      return false;
    } catch (e) {
      debugPrint(e.toString());
    }

    return false;
  }

  Future<bool> deleteRemoteUserBloodTarget(int userBTId) async {
    try {
      final response = await networkManager.send<GenericResponseModel, GenericResponseModel>(
        endPointUrl,
        parseModel: GenericResponseModel(),
        method: RequestType.DELETE,
        data: [userBTId],
      );

      if (response.data!.errorCode == "OK") {
        return true;
      }

      return false;
    } catch (e) {
      debugPrint(e.toString());
    }

    return false;
  }

  Future<bool> updateRemoteUserBloodTarget(UserBloodTargetModel userBloodTargetModel) async {
    try {
      final response = await networkManager.send<GenericResponseModel, GenericResponseModel>(
        endPointUrl,
        parseModel: GenericResponseModel(),
        method: RequestType.PUT,
        data: {"bloodTarget": userBloodTargetModel},
      );

      if (response.data!.errorCode == "OK") {
        return true;
      }

      return false;
    } catch (e) {
      debugPrint(e.toString());
    }

    return false;
  }
}
