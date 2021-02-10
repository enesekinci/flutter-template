import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/auth_controller.dart';
import '../controller/base_controller.dart';
import '../controller/main_controller.dart';

// ignore: must_be_immutable
class BaseView<T extends BaseController> extends StatelessWidget {
  final MainController mainController = Get.put(MainController());
  double dynamicHeight({double height = 1}) => Get.height * height;
  double dynamicWidth({double width = 1}) => Get.width * width;
  bool isPhone() => GetPlatform.isMobile;
  bool isVertical() => Get.context.isPortrait;

  final Widget Function(BuildContext context, T controller) onPageBuilder;
  final BaseController controller;

  BaseView({Key key, @required this.onPageBuilder, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (AuthController.instance.isLoading == true) {
        return Scaffold(
          body: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: dynamicHeight(height: 0.1),
                    width: dynamicWidth(width: 0.2),
                    child: CircularProgressIndicator(
                      strokeWidth: 6,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "yükleniyor...",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent[400]),
                  ),
                ],
              ),
            ),
          ),
        );
      }
      return onPageBuilder(context, controller);
    });
  }
}

class BaseState {
  final MainController mainController = Get.put(MainController());
  double dynamicHeight(double value) => Get.height * value;
  double dynamicWidth(double value) => Get.width * value;
  bool isPhone() => GetPlatform.isMobile;
  bool isVertical() => Get.context.isPortrait;
}
