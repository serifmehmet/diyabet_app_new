import 'package:diyabet_app/core/base/error/app_exception.dart';
import 'package:diyabet_app/core/base/model/generic_response_model.dart';
import 'package:diyabet_app/core/constants/enums/preferences_keys.dart';
import 'package:diyabet_app/core/init/cache/cache_manager.dart';
import 'package:diyabet_app/data/datasources/remote/models/recipe/remote_recipe_model.dart';
import 'package:diyabet_app/data/datasources/remote/models/recipe/remote_recipe_root_model.dart';
import 'package:diyabet_app/product/model/query/recipe_queries.dart';
import 'package:vexana/vexana.dart';

class RemoteRecipeDataSource {
  final NetworkManager networkManager;

  RemoteRecipeDataSource(this.networkManager);

  //Endpoint
  static const String endpoint = "/Recipe";

  ///Method to get the recipes by single user
  Future<RemoteRecipeRootModel?> getRecipeByUserId(int userId) async {
    try {
      final response = await networkManager.send<RemoteRecipeRootModel, RemoteRecipeRootModel>(
        endpoint,
        parseModel: RemoteRecipeRootModel(),
        queryParameters: Map.fromEntries([RecipeQueries.list.toMapEntry(userId.toString())]),
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

      return response.data;
    } on DioError {
      return null;
    }
  }

  Future<GenericResponseModel?> addNewRecipe(RemoteRecipeModel recipeModel) async {
    try {
      final response = await networkManager.send<GenericResponseModel, GenericResponseModel>(
        endpoint,
        parseModel: GenericResponseModel(),
        method: RequestType.POST,
        data: recipeModel,
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

      return response.data;
    } on DioError {
      return null;
    }
  }
}
