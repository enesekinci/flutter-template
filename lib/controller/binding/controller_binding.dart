import 'package:get/get.dart';

import '../../_core/controller/main_controller.dart';
import '../counter_controller.dart';

class ControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController(), tag: "MainController");
    Get.lazyPut<CounterController>(() => CounterController(), tag: "CounterController");
  }
}
