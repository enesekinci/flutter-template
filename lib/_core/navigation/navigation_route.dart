import 'package:get/get.dart';

import '../../main.dart';

class NavigationRoute {
  static NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  final List<GetPage> routes = [
    GetPage(name: "/", page: () => MyApp()),
    GetPage(name: "/second-page", page: () => SecondPage()),
  ];
}
