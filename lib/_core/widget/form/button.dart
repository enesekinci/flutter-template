import 'package:flutter/material.dart';

class ButtonWidgets {
  static ButtonWidgets _instance;
  static ButtonWidgets get instance {
    if (_instance == null) _instance = ButtonWidgets._init();
    return _instance;
  }

  ButtonWidgets._init();

  Widget buildSignupBtn() {
    return Text("");
  }

  Widget buildForgotPasswordBtn() {
    return Text("");
  }

  Widget buildLoginBtn() {
    return Text("");
  }

  

  Widget buildSocialBtnRow() {
    return Text("");
  }
}
