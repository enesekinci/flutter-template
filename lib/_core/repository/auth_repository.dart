import 'package:fluttertemplate/_core/cache/storage_manager.dart';
import 'package:fluttertemplate/model/user_model.dart';

import '../network/network_manager.dart';

class AuthRepository {
  final network = NetworkManager.instance;

  static AuthRepository _instance;
  static AuthRepository get instance {
    if (_instance == null) _instance = AuthRepository._init();
    return _instance;
  }

  AuthRepository._init();

  Future<dynamic> login({String email, String password, bool rememberMe}) async {
    dynamic response = await network.post(
      path: "/login",
      data: {"email": email, "password": password},
      // options: Options(headers: {
      // 'Authorization': 'Bearer ' + AuthController.instance.token,
      // })
    );

    print("auth repo");
    print(response);

    if (response != false) {
      User authUser = new User(
          id: BigInt.from(response['user']['id']),
          name: response['user']['name'].toString() ?? "super",
          email: response['user']['email'].toString() ?? "super@super.com");
      print("auth repo rememberMe => " + rememberMe.toString());
      if (rememberMe) {
        print("auth repo token => " + response['token']);
        StorageManager.instance.setData(key: "auth_token", data: response['token']);
        StorageManager.instance.setData(key: "auth_user", data: response['user']);
      }
      return {
        "authUser": authUser,
        "token": response['token'],
      };
    }

    return false;
  }

  Future<void> logout() async {
    await StorageManager.instance.deleteData(key: "auth_token");
    await StorageManager.instance.deleteData(key: "auth_user");
  }
}
