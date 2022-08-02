import 'package:diyabet_app/core/constants/enums/preferences_keys.dart';
import 'package:diyabet_app/core/init/cache/cache_manager.dart';
import 'package:diyabet_app/data/datasources/remote/models/user/user_model.dart';
import 'package:vexana/vexana.dart';

class UserRemoteDataSource {
  static const String loginUrl = "/login";
  static const String registerUrl = '/register';

  final NetworkManager networkManager;

  UserRemoteDataSource(this.networkManager);

  Future<UserModel?> userLogin(String email, String password) async {
    final response = await networkManager.post(
      loginUrl,
      data: {"userId": email, "password": password},
    );
    UserModel? userModel;
    if (response.statusCode == 200) {
      userModel = UserModel.fromJson(response.data);
      String? sessionId = response.headers["X-Session-Id"]!.first.toString();

      CacheManager.instance.setStringValue(PreferencesKeys.X_SESSION_ID, sessionId);
    }

    // final response = await networkManager.send<UserModel, UserModel>(
    //   loginUrl,
    //   parseModel: UserModel(),
    //   method: RequestType.POST,
    //   data: {"userId": email, "password": password},
    // );

    return userModel;
  }

  Future<UserModel?> userRegister(UserModel? userModel) async {
    final response = await networkManager.send<UserModel, UserModel>(
      registerUrl,
      parseModel: UserModel(),
      method: RequestType.POST,
      data: userModel,
    );

    return response.data;
  }
}
