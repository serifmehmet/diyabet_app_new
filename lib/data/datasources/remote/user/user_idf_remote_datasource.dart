import 'package:diyabet_app/core/base/model/generic_response_model.dart';
import 'package:diyabet_app/data/datasources/remote/models/user/user_idf_model.dart';
import 'package:vexana/vexana.dart';

class UserIdfRemoteDataSource {
  final NetworkManager networkManager;

  UserIdfRemoteDataSource(this.networkManager);

  static const String endpointUrl = "UserIdf";

  Future<bool> createUserIdf(UserIdfModel? userIdfModel) async {
    final response = await networkManager.send<GenericResponseModel, GenericResponseModel>(
      endpointUrl,
      parseModel: GenericResponseModel(),
      method: RequestType.POST,
      data: {
        "UserIdfs": [userIdfModel]
      },
    );
    if (response.data!.errorCode == "OK") {
      return true;
    }
    return false;
  }
}
