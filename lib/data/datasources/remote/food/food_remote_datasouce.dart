// import 'package:diyabet_app/data/datasources/remote/models/food.dart';
import 'package:diyabet_app/data/datasources/remote/models/food/remote_food_root_model.dart';

import 'package:diyabet_app/product/model/query/food_queries.dart';
import 'package:vexana/vexana.dart';

class FoodRemoteDataSource {
  static const String url = "/Food";

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
    final response = await networkManager.send<RemoteFoodRootModel, RemoteFoodRootModel>(
      url,
      parseModel: RemoteFoodRootModel(),
      method: RequestType.GET,
      queryParameters: Map.fromEntries([FoodQueries.single.toMapEntry(id.toString())]),
    );

    return response.data;
  }
}
