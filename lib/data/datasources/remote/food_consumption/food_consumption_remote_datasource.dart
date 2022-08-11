import 'package:diyabet_app/core/constants/enums/preferences_keys.dart';
import 'package:diyabet_app/core/init/cache/cache_manager.dart';
import 'package:diyabet_app/data/datasources/remote/models/food_consumption/food_consumption_model.dart';
import 'package:diyabet_app/data/datasources/remote/models/meal/meal_root_model.dart';
import 'package:vexana/vexana.dart';

class FoodConsumptionRemoteDataSource {
  FoodConsumptionRemoteDataSource(this.networkManager);

  static const String url = "/consumption";

  final NetworkManager networkManager;

  Future<void> addConsumption(FoodConsumptionModel model) async {
    final response = await networkManager.send<FoodConsumptionModel, FoodConsumptionModel>(
      url,
      parseModel: FoodConsumptionModel(),
      method: RequestType.POST,
      data: model,
      options: Options(
        headers: {
          "X-Session-Id": CacheManager.instance.getStringValue(PreferencesKeys.X_SESSION_ID),
          "X-User-Id": CacheManager.instance.getIntValue(PreferencesKeys.USERID).toString(),
        },
      ),
    );
  }

  Future<MealRootModel?> getFoodConsumptionByDate(int userId, DateTime dateToFilter) async {
    final urlToSend = '$url?userId=$userId&date=$dateToFilter';
    final response = await networkManager.send<MealRootModel, MealRootModel>(
      urlToSend,
      parseModel: MealRootModel(),
      method: RequestType.GET,
      options: Options(
        headers: {
          "X-Session-Id": CacheManager.instance.getStringValue(PreferencesKeys.X_SESSION_ID),
          "X-User-Id": CacheManager.instance.getIntValue(PreferencesKeys.USERID).toString(),
        },
      ),
    );

    return response.data;
  }
}
