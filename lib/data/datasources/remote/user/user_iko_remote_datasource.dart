import 'package:diyabet_app/core/base/model/generic_response_model.dart';
import 'package:vexana/vexana.dart';

import '../models/user/user_iko_model.dart';

class UserIkoRemoteDataSource {
  final NetworkManager networkManager;

  UserIkoRemoteDataSource(this.networkManager);

  static const String endpointUrl = "/UserIko";

  Future<bool> createUserIko(UserIkoModel? userIkoModel) async {
    try {
      final response = await networkManager.send<GenericResponseModel, GenericResponseModel>(
        endpointUrl,
        parseModel: GenericResponseModel(),
        method: RequestType.POST,
        data: {
          "UserIkos": [userIkoModel]
        },
      );
      if (response.data!.errorCode == "OK") {
        return true;
      }
      return false;
    } catch (e) {
      print(e.toString());
    }

    return false;
  }

  Future<bool> deleteRemoteUserIko(int? userIkoId) async {
    try {
      final response = await networkManager.send<GenericResponseModel, GenericResponseModel>(
        endpointUrl,
        parseModel: GenericResponseModel(),
        method: RequestType.DELETE,
        data: [userIkoId],
      );

      if (response.data!.errorCode == "OK") {
        return true;
      }

      return false;
    } catch (e) {
      print(e.toString());
    }
    return false;
  }
}
