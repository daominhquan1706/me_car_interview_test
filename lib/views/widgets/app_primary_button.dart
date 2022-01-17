import 'package:flutter/material.dart';
import 'package:me_car_interview_test/utils/constants.dart';

class AppPrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  const AppPrimaryButton(
      {Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: AppButtonStyle.buttonBlackStyle,
      child: Text(
        text.toUpperCase(),
        style: AppTextStyle.buttonText,
      ),
    );
  }
}
