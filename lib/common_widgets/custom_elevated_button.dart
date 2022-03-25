import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton(
      {required this.child,
        required this.color,
        this.borderRadius: 2.0,
        this.height: 50.0,
        this.width: 170.0,
        required this.onPressed});

  late final Widget child;
  late final Color color;
  late final double borderRadius;
  late final double height;
  late final double width;
  late final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: color,
            onSurface: color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(borderRadius)))),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}