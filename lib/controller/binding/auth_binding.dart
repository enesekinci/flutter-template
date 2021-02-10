import 'package:get/get.dart';

import '../../_core/controller/auth_controller.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController.instance, tag: "AuthController");
    // Get.lazyPut<MainController>(() => MainController(), tag: "MainController");
    // Get.lazyPut<CounterController>(() => CounterController(), tag: "CounterController");
  }
}
