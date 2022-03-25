import 'package:flutter/material.dart';
import 'package:evenizer/common_widgets/custom_elevated_button.dart';

class FormSubmitButton extends CustomElevatedButton {
  FormSubmitButton({
    required String text,
    required Color color,
    required Color textColor,
    required VoidCallback? onPressed,
  }) : super(
    child: Text(
      text,
      style: TextStyle(color: textColor, fontSize: 20.0),
    ),
    height: 40.0,
    color: color,
    borderRadius: 20.0,
    onPressed: onPressed,
  );
}