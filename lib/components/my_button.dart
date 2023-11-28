import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  final String label;
  VoidCallback onPressed;

  MyButton({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.green.shade300,
      textColor: Colors.white,
      child: Text(label),
    );
  }
}
