import 'package:get/get.dart';

import '../../view/authenticate/login/view/login_page.dart';
import '../../view/barcode/barcode_reader.dart';
import '../../view/main_events_page.dart';
import '../../view/main_page.dart';

class NavigationRoute {
  static NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  final List<GetPage> routes = [
    GetPage(name: "/", page: () => MainPage(), transition: Transition.cupertino),
    GetPage(name: "/login", page: () => LoginPage(), transition: Transition.cupertino),
    GetPage(name: "/second-page", page: () => SecondPage(), transition: Transition.cupertino),
    GetPage(name: "/barcode-reader", page: () => BarCodeReader(), transition: Transition.cupertino),
    GetPage(name: "/events", page: () => MainEventsPage(), transition: Transition.cupertino),
  ];
}
