import 'package:diyabet_app/data/datasources/remote/models/food_cache_model.dart';
import 'package:vexana/vexana.dart';

class FoodCacheRemoteDataSource {
  static const String foodCacheUrl = "/FoodCache";

  final NetworkManager networkManager;

  FoodCacheRemoteDataSource(this.networkManager);

  Future<List<FoodCacheModel>?> getAllFoodsForCache() async {
    final response = await networkManager.send<FoodCacheModel, List<FoodCacheModel>>(
      foodCacheUrl,
      parseModel: FoodCacheModel(),
      method: RequestType.GET,
    );

    return response.data;
  }
}
