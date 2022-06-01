import 'package:diyabet_app/data/datasources/remote/models/food_consumption/food_consumption_model.dart';
import 'package:vexana/vexana.dart';

class FoodConsumptionRemoteDataSource {
  static const String url = "/AddConsumption";

  final NetworkManager networkManager;

  FoodConsumptionRemoteDataSource(this.networkManager);

  Future<FoodConsumptionModel?> addConsumption(FoodConsumptionModel model) async {
    final response = await networkManager.send<FoodConsumptionModel, FoodConsumptionModel>(
      url,
      parseModel: FoodConsumptionModel(),
      method: RequestType.POST,
      data: model,
    );

    return response.data;
  }
}
