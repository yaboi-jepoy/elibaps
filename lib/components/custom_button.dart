import 'package:flutter/material.dart';

class CustomButtonIcon extends StatelessWidget {
  VoidCallback onPressed;
  final Icon icon = icon;

  CustomButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: onPressed);
  }
}
