import 'package:flutter/material.dart';

class myButton extends StatelessWidget {
  final String label;
  VoidCallback onPressed;

  myButton({super.key, required this.label, required this.onPressed});

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
