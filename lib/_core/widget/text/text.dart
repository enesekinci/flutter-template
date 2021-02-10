import 'package:flutter/material.dart';

class TextWidgets {
  static TextWidgets _instance;
  static TextWidgets get instance {
    if (_instance == null) _instance = TextWidgets._init();
    return _instance;
  }

  TextWidgets._init();

  Widget buildSignInWithText() {
    return Text("");
  }
}
