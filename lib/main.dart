import 'package:elibaps/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  debugPaintSizeEnabled = false;
  runApp(const Pabili());
}

class Pabili extends StatelessWidget {
  const Pabili({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: const HomePage(),
      theme: ThemeData(
        primaryColor: Colors.green.shade800,
      ),
    );
  }
}
