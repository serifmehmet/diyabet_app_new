import 'package:diyabet_app/data/datasources/remote/models/food_consumption/food_consumption_model.dart';
import 'package:diyabet_app/data/datasources/remote/models/meal/meal_root_model.dart';
import 'package:diyabet_app/domain/entities/meal_root.dart';
import 'package:vexana/vexana.dart';

class FoodConsumptionRemoteDataSource {
  static const String url = "/consumption";

  final NetworkManager networkManager;

  FoodConsumptionRemoteDataSource(this.networkManager);

  Future<void> addConsumption(FoodConsumptionModel model) async {
    final response = await networkManager.send<FoodConsumptionModel, FoodConsumptionModel>(
      url,
      parseModel: FoodConsumptionModel(),
      method: RequestType.POST,
      data: model,
    );
  }

  Future<MealRootModel?> getFoodConsumptionByDate(int userId, DateTime dateToFilter) async {
    final urlToSend = url + '?userId=' + userId.toString() + '&date=' + dateToFilter.toString();
    final response = await networkManager.send<MealRootModel, MealRootModel>(
      urlToSend,
      parseModel: MealRootModel(),
      method: RequestType.GET,
    );

    return response.data;
  }
}
