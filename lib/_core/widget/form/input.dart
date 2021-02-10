import 'package:flutter/material.dart';

class InputWidgets {
  static InputWidgets _instance;
  static InputWidgets get instance {
    if (_instance == null) _instance = InputWidgets._init();
    return _instance;
  }

  InputWidgets._init();

  Widget buildEmailTextBox() {
    return Text("");
  }

  Widget buildRememberMeCheckbox({bool remember, dynamic data}) {
    return Text("");
  }

  Widget buildPasswordTextBox() {
    return Text("");
  }
}
