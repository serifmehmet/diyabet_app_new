// import 'package:diyabet_app/data/datasources/remote/models/food.dart';
import 'package:diyabet_app/core/base/model/generic_response_model.dart';
import 'package:diyabet_app/core/constants/enums/preferences_keys.dart';
import 'package:diyabet_app/core/init/cache/cache_manager.dart';
import 'package:diyabet_app/data/datasources/remote/models/food/favorite_food_root_model.dart';
import 'package:diyabet_app/data/datasources/remote/models/food/remote_food_root_model.dart';
import 'package:diyabet_app/product/model/query/favorite_food_query.dart';

import 'package:diyabet_app/product/model/query/food_queries.dart';
import 'package:vexana/vexana.dart';

class FoodRemoteDataSource {
  static const String url = "/Food";
  static const String favoriteFoodUrl = "/FavoriteFoods";

  FoodRemoteDataSource(this.networkManager);

  final NetworkManager networkManager;

  // Future<FoodModel?> getFoodByName(String foodName) async {
  //   final response = await networkManager.send<FoodModel, FoodModel>(
  //     url,
  //     parseModel: FoodModel(),
  //     method: RequestType.GET,
  //     queryParameters: Map.fromEntries([FoodQueries.query.toMapEntry(foodName)]),
  //   );

  //   return response.data;
  // }

  Future<RemoteFoodRootModel?> getFoodById(int id) async {
    final response = await networkManager.send<RemoteFoodRootModel, RemoteFoodRootModel>(url,
        parseModel: RemoteFoodRootModel(),
        method: RequestType.GET,
        queryParameters: Map.fromEntries([FoodQueries.single.toMapEntry(id.toString())]),
        options: Options(headers: {
          "X-Session-Id": CacheManager.instance.getStringValue(PreferencesKeys.X_SESSION_ID),
          "X-User-Id": CacheManager.instance.getIntValue(PreferencesKeys.USERID).toString(),
        }));

    return response.data;
  }

  Future<GenericResponseModel> saveFavoriteFoodInfo(int foodId) async {
    final userId = CacheManager.instance.getIntValue(PreferencesKeys.USERID);
    final response = await networkManager.send<GenericResponseModel, GenericResponseModel>(
      favoriteFoodUrl,
      parseModel: GenericResponseModel(),
      method: RequestType.POST,
      data: {"UserId": userId, "FoodId": foodId},
      options: Options(headers: {
        "X-Session-Id": CacheManager.instance.getStringValue(PreferencesKeys.X_SESSION_ID),
        "X-User-Id": userId.toString(),
      }),
    );

    return response.data!;
  }

  Future<FavoriteFoodRootModel> getFavoriteFoods() async {
    final userId = CacheManager.instance.getIntValue(PreferencesKeys.USERID);
    final response = await networkManager.send<FavoriteFoodRootModel, FavoriteFoodRootModel>(
      favoriteFoodUrl,
      queryParameters: Map.fromEntries([FavoriteFoodQuery.user.toMapEntry(userId.toString())]),
      method: RequestType.GET,
      parseModel: FavoriteFoodRootModel(),
      options: Options(
        headers: {
          "X-Session-Id": CacheManager.instance.getStringValue(PreferencesKeys.X_SESSION_ID),
          "X-User-Id": userId.toString(),
        },
      ),
    );

    return response.data!;
  }
}
