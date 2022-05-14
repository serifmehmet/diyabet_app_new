import 'package:diyabet_app/data/datasources/remote/models/user_model.dart';
import 'package:vexana/vexana.dart';

class UserRemoteDataSource {
  static const String loginUrl = "/login";

  final NetworkManager networkManager;

  UserRemoteDataSource(this.networkManager);

  Future<UserModel?> userLogin(String email, String password) async {
    final response = await networkManager.send<UserModel, UserModel>(
      loginUrl,
      parseModel: UserModel(),
      method: RequestType.POST,
      data: {"userId": email, "password": password},
    );

    return response.data;
  }
}
