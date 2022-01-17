import 'package:flutter/material.dart';
import 'package:me_car_interview_test/utils/constants.dart';

class AppSecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const AppSecondaryButton(
      {Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: AppButtonStyle.buttonWhiteStyle,
      child: Text(
        text.toUpperCase(),
        style: AppTextStyle.buttonText,
      ),
    );
  }
}
