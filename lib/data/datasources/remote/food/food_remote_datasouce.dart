import 'package:diyabet_app/data/datasources/remote/models/food.dart';
import 'package:diyabet_app/product/model/query/food_queries.dart';
import 'package:vexana/vexana.dart';

class FoodRemoteDataSource {
  static const String url = "https://calorieninjas.p.rapidapi.com/v1/nutrition";

  FoodRemoteDataSource(this.networkManager);

  final NetworkManager networkManager;

  Future<FoodModel?> getFoodByName(String foodName) async {
    final response = await networkManager.send<FoodModel, FoodModel>(
      url,
      parseModel: FoodModel(),
      method: RequestType.GET,
      queryParameters: Map.fromEntries([FoodQueries.query.toMapEntry(foodName)]),
    );

    return response.data;
  }
}
