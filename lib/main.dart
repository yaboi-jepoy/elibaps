// ignore_for_file: unused_local_variable

import 'package:elibaps/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  debugPaintSizeEnabled = false;

  // initialize hive
  await Hive.initFlutter();

  // open a box
  var box = await Hive.openBox('myBox');

  runApp(const Pabili());
}

class Pabili extends StatelessWidget {
  const Pabili({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(
        primaryColor: Colors.green.shade800,
      ),
    );
  }
}
