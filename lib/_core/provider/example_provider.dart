import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';

abstract class BaseProvider extends GetConnect {
  final String baseurl;
  String token;
  BaseProvider({@required this.baseurl, this.token});

  @override
  void onInit() {
    httpClient.baseUrl = this.baseUrl;

    httpClient.addRequestModifier((request) {
      request.headers['app_name'] = 'flutter-template';
      return request;
    });

    httpClient.addAuthenticator((request) async {
      final response = await get("http://yourapi/token");
      final token = response.body['token'];
      // Set the header
      request.headers['Authorization'] = "$token";
      return request;
    });
  }

  Future<Response> getRequest({String path}) async {
    return null;
  }

  Future<Response> postRequest({String path, Map data}) async {
    return null;
  }

  Future getList() async {}

  Future getFilteredList({Map filter}) async {}

  Future store({Map data}) async {
    return null;
  }

  Future findById({int id}) async {
    return null;
  }

  Future update({Map data}) async {
    return null;
  }

  Future destroy({int id}) async {
    return null;
  }

  Future<Response> postWithFile(Map data) {
    final form = FormData({
      'file': MultipartFile(data['image'], filename: 'avatar.png'),
      'otherFile': MultipartFile(data['image'], filename: 'cover.png'),
    });
    return post('http://youapi/users/upload', form);
  }

  Future listenSocket() async {}
}
