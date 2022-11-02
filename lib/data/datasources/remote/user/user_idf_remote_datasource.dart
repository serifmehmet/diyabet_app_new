import 'package:vexana/vexana.dart';

import '../../../../core/base/model/generic_response_model.dart';
import '../../../../core/constants/enums/preferences_keys.dart';
import '../../../../core/init/cache/cache_manager.dart';
import '../models/user/user_idf_model.dart';

class UserIdfRemoteDataSource {
  final NetworkManager networkManager;

  UserIdfRemoteDataSource(this.networkManager);

  static const String endpointUrl = "/UserIdf";

  Future<bool> createUserIdf(UserIdfModel? userIdfModel) async {
    try {
      final response = await networkManager.send<GenericResponseModel, GenericResponseModel>(
        endpointUrl,
        parseModel: GenericResponseModel(),
        method: RequestType.POST,
        data: {
          "UserIdfs": [userIdfModel]
        },
        options: Options(
          headers: {
            "X-Session-Id": CacheManager.instance.getStringValue(PreferencesKeys.X_SESSION_ID),
            "X-User-Id": CacheManager.instance.getIntValue(PreferencesKeys.USERID).toString(),
          },
        ),
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

  Future<bool> deleteRemoteUserIdf(int? userIdfId) async {
    try {
      final response = await networkManager.send<GenericResponseModel, GenericResponseModel>(
        endpointUrl,
        parseModel: GenericResponseModel(),
        method: RequestType.DELETE,
        data: [userIdfId],
        options: Options(
          headers: {
            "X-Session-Id": CacheManager.instance.getStringValue(PreferencesKeys.X_SESSION_ID),
            "X-User-Id": CacheManager.instance.getIntValue(PreferencesKeys.USERID).toString(),
          },
        ),
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
