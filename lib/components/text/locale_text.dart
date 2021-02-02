import 'package:flutter/cupertino.dart';

class LocaleText extends StatelessWidget {
  final String text;

  const LocaleText({Key key, @required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(this.text);
  }
}
