import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../model/user_model.dart';
import '../cache/storage_manager.dart';
import '../repository/auth_repository.dart';
import 'base_controller.dart';

class AuthController extends BaseController {
  final repository = AuthRepository.instance;
  Rx<User> _authUser;
  String _email;
  String _username;
  RxBool _isLogin = false.obs;
  String _token;
  String _refreshToken;

  Rx<User> get authUser => _authUser;
  bool get isLogin => _isLogin.value;
  String get email => _email;
  String get username => _username;
  String get token => _token;
  String get refreshToken => _refreshToken;

  static AuthController _instance;
  static AuthController get instance {
    if (_instance == null) _instance = AuthController._init();
    return _instance;
  }

  AuthController._init() {
    print("AuthController._init");
    _token = StorageManager.instance.getData(key: "auth_token") ?? null;
    _refreshToken = StorageManager.instance.getData(key: "auth_refresh_token") ?? null;

    print("token");
    print(_token);

    // if (_token != null && isTokenExpired()) {
    if (_token != null) {
      _isLogin.value = true;
    } else {
      _isLogin.value = false;
      _token = null;
      _refreshToken = null;
    }
  }

  Future<bool> login({String email, String password, bool rememberMe}) async {
    openLoading();

    Future.delayed(Duration(seconds: 3));

    _isLogin.value = false;

    if (!GetUtils.isEmail(email) || password == null || password.length < 6) return false;

    print("auth controller rememberMe => " + rememberMe.toString());

    dynamic response = await repository.login(email: email, password: password, rememberMe: rememberMe);

    print("auth controller");
    print(response);

    if (response != false) {
      _isLogin.value = true;
      _email = email;
      User responseUser = response['authUser'];
      _authUser = responseUser.obs;
      _token = response['token'];
      closeLoading();
      return true;
    }
    return false;
  }

  bool loginWithGoogle() {
    return true;
  }

  bool loginWithFacebook() {
    return true;
  }

  bool resetPassword() {
    return true;
  }

  Future<void> logout() async {
    openLoading();
    await Future.delayed(Duration(seconds: 3));
    _authUser = null;
    _email = null;
    _username = null;
    _token = null;
    _refreshToken = null;
    _isLogin.value = false;
    await repository.logout();
    closeLoading();
  }

  bool register({String email, String password}) {
    return false;
  }

  bool isTokenExpired() {
    return JwtDecoder.isExpired(_token);
  }

  Map<dynamic, dynamic> decodeToken() {
    return JwtDecoder.decode(_token);
  }
}
