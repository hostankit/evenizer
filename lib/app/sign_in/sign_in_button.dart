import 'package:flutter/material.dart';
import 'package:evenizer/common_widgets/custom_elevated_button.dart';

class SignInButton extends CustomElevatedButton {
  SignInButton({
    required String text,
    required Color color,
    required Color textColor,
    required VoidCallback? onPressed,
  }) : super(
      child: Text(
        text,
        style: TextStyle(color: textColor, fontSize: 15.0),
      ),
      color: color,
      onPressed: onPressed,
      borderRadius: 20.0
  );
}