import 'package:fluttertemplate/view/barcode/barcode_reader.dart';
import 'package:get/get.dart';

import '../../view/authenticate/login/view/login_page.dart';
import '../../view/main_page.dart';

class NavigationRoute {
  static NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  final List<GetPage> routes = [
    GetPage(name: "/", page: () => MainPage()),
    GetPage(name: "/login", page: () => LoginPage()),
    GetPage(name: "/second-page", page: () => SecondPage()),
    GetPage(name: "/barcode-reader", page: () => BarCodeReader()),
  ];
}
