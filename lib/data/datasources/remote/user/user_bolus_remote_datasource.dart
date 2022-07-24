import 'package:diyabet_app/core/base/model/generic_response_model.dart';
import 'package:diyabet_app/data/datasources/remote/models/user/user_bolus_model.dart';
import 'package:vexana/vexana.dart';

class UserBolusRemoteDataSource {
  static const String endpoint = "/UserBolus";

  final NetworkManager networkManager;

  UserBolusRemoteDataSource(this.networkManager);

  Future<GenericResponseModel> saveCalculatedBolusValue(UserBolusModel userBolusModel, int mealId) async {
    final response = await networkManager.send<GenericResponseModel, GenericResponseModel>(
      endpoint,
      parseModel: GenericResponseModel(),
      method: RequestType.POST,
      data: {"mealId": mealId, "userBolus": userBolusModel},
    );

    return response.data!;
  }
}
