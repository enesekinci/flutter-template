import 'package:dio/dio.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:get_storage/get_storage.dart';

import '../../model/base_error.dart';
import '../model/base_model.dart';

class NetworkManager {
  Dio _dio;
  static NetworkManager _instance = NetworkManager._init();
  static NetworkManager get instance => _instance;
  NetworkManager._init() {
    final _baseOptions = BaseOptions(
      baseUrl: "",
      headers: {"val": GetStorage().read("jwt_token"), "": ""},
    );
    _dio = Dio(_baseOptions);

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (request) {
        request.path += "Enes";
      },
      onResponse: (response) {
        return response.data;
      },
      onError: (error) {
        return BaseError(message: error.message);
      },
    ));
  }

  Future dioGet<T extends BaseModel>(String path, T model) async {
    final response = await _dio.get(path);

    switch (response.statusCode) {
      case HttpStatus.ok:
        final responseBody = response.data;

        if (responseBody is List) {
          return responseBody.map((e) => model.fromJson(e)).toList();
        } else if (responseBody is Map) {
          return model.fromJson(responseBody);
        }

        return responseBody;

        break;
      default:
    }
  }
}
