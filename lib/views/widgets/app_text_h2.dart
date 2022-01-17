import 'package:flutter/material.dart';

class AppTextH2 extends StatelessWidget {
  final String text;
  const AppTextH2(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 13,
      ),
    );
  }
}
