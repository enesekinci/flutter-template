import 'package:flutter/material.dart';
import 'package:fluttertemplate/_core/controller/main_controller.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class BaseView<BaseController> extends StatelessWidget {
  final MainController mainController = Get.put(MainController());
  double dynamicHeight(double value) => Get.height * value;
  double dynamicWidth(double value) => Get.width * value;
  bool isPhone() => GetPlatform.isMobile;
  bool isVertical() => Get.context.isPortrait;

  final Widget Function(BuildContext context, BaseController controller) onPageBuilder;
  final BaseController controller;

  BaseView({
    Key key,
    @required this.onPageBuilder,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return onPageBuilder(context, controller);
  }
}
