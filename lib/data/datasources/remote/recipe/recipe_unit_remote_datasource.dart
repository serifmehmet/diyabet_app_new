import 'package:diyabet_app/core/base/error/app_exception.dart';
import 'package:diyabet_app/data/datasources/remote/models/recipe/remote_recipe_unit_root_model.dart';
import 'package:vexana/vexana.dart';

import '../../../../core/constants/enums/preferences_keys.dart';
import '../../../../core/init/cache/cache_manager.dart';

class RemoteRecipeUnitDataSource {
  final NetworkManager networkManager;

  RemoteRecipeUnitDataSource(this.networkManager);

  static const String endPoint = "/RecipeUnitCache";

  Future<RemoteRecipeUnitRootModel?> getRecipeUnits() async {
    try {
      final response = await networkManager.send<RemoteRecipeUnitRootModel, RemoteRecipeUnitRootModel>(
        endPoint,
        parseModel: RemoteRecipeUnitRootModel(),
        method: RequestType.GET,
        options: Options(
          headers: {
            "X-Session-Id": CacheManager.instance.getStringValue(PreferencesKeys.X_SESSION_ID),
            "X-User-Id": CacheManager.instance.getIntValue(PreferencesKeys.USERID),
          },
        ),
      );

      if (response.error != null) {
        if (response.error!.statusCode == 401) throw const UnAuthorized();
      }

      return response.data!;
    } on DioError {
      return null;
    }
  }
}
