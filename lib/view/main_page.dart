import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../_core/controller/auth_controller.dart';
import 'authenticate/login/view/login_page.dart';
import 'home/home_page.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AuthController.instance.isLogin == true ? HomePage() : LoginPage();
    });
  }
}
