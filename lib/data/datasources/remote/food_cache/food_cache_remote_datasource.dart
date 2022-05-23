import 'package:diyabet_app/data/datasources/remote/models/food/cache_food_model.dart';
import 'package:vexana/vexana.dart';

class FoodCacheRemoteDataSource {
  static const String foodCacheUrl = "/FoodCache";

  final NetworkManager networkManager;

  FoodCacheRemoteDataSource(this.networkManager);

  Future<CacheFoodModel?> getAllFoodsForCache() async {
    final response = await networkManager.send<CacheFoodModel, CacheFoodModel>(
      foodCacheUrl,
      parseModel: CacheFoodModel(),
      method: RequestType.GET,
    );

    return response.data;
  }
}
