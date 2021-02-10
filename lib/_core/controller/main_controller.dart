import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/app_theme.dart';
import 'base_controller.dart';

class MainController extends BaseController {
  changeTheme() {
    print("change Theme");
    print(Get.isDarkMode);
    Get.changeTheme(Get.isDarkMode ? AppTheme.instance.lightTheme : AppTheme.instance.darkTheme);
  }

  getThemePrimaryColor() {
    return Get.isDarkMode ? AppTheme.instance.darkTheme.primaryColor : AppTheme.instance.lightTheme.primaryColor;
  }

  showSnackBar(
      {String title, String text, Color textColor = Colors.white, SnackPosition position = SnackPosition.TOP, Color backgroundColor = Colors.white}) {
    Get.snackbar(
      title,
      text,
      colorText: textColor,
      snackPosition: position,
      backgroundColor: backgroundColor,
      snackStyle: SnackStyle.GROUNDED,
      margin: EdgeInsets.only(bottom: 5.0),
    );
  }

  Locale getLocale() {
    return Get.deviceLocale;
  }

  changeLocale({String languae}) {
    Get.updateLocale(Locale(languae));
  }

  emailValidator({String email}) {
    return GetUtils.isEmail(email) ? true : false;
  }
}
