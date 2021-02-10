import 'package:get/get.dart';

abstract class BaseProvider extends GetConnect {
  final String baseurl;

  BaseProvider({this.baseurl});

  @override
  void onInit() {
    httpClient.baseUrl = this.baseUrl;
  }

  Future<Response> getRequest({String path});

  Future<Response> postRequest({String path, Map data});

  Future<List> getList();

  Future<List> getFilteredList({Map filter});

  Future<Map> store({Map data});

  Future<Map> findById({int id});

  Future<Map> update({Map data});

  Future<dynamic> destroy({int id});

  GetSocket listenSocket();
}
