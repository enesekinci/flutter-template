import 'package:flutter/material.dart';
import 'package:fluttertemplate/_core/theme/app_theme.dart';
import 'package:get/get.dart';

import 'base_controller.dart';

class MainController extends BaseController {
  changeTheme() {
    Get.changeTheme(Get.isDarkMode ? AppTheme.instance.lightTheme : AppTheme.instance.darkTheme);
  }

  showSnackBar({String title, String text, Color textColor = Colors.white, SnackPosition position = SnackPosition.TOP}) {
    Get.snackbar(title, text, colorText: textColor, snackPosition: position);
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
