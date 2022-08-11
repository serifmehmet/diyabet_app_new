import 'package:vexana/vexana.dart';

import '../../../../core/base/model/generic_response_model.dart';
import '../../../../core/constants/enums/preferences_keys.dart';
import '../../../../core/init/cache/cache_manager.dart';
import '../models/user/user_bolus_model.dart';

class UserBolusRemoteDataSource {
  static const String endpoint = "/UserBolus";

  final NetworkManager networkManager;

  UserBolusRemoteDataSource(this.networkManager);

  Future<GenericResponseModel> saveCalculatedBolusValue(UserBolusModel userBolusModel, int mealId) async {
    final response = await networkManager.send<GenericResponseModel, GenericResponseModel>(
      endpoint,
      parseModel: GenericResponseModel(),
      method: RequestType.POST,
      data: {"mealId": mealId, "userBolus": userBolusModel},
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
