// ignore_for_file: must_be_immutable

import 'package:elibaps/components/my_button.dart';
import 'package:flutter/material.dart';

class BottomUI extends StatefulWidget {
  VoidCallback onPressed;
  num itemText;
  num priceText;
  BottomUI(
      {super.key,
      required this.itemText,
      required this.priceText,
      required this.onPressed});

  @override
  State<BottomUI> createState() => _BottomUIState();
}

class _BottomUIState extends State<BottomUI> {
  @override
  Widget build(BuildContext context) {
    // variables
    num price = widget.priceText;
    num count = widget.itemText;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        alignment: Alignment.centerRight,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.green.shade200,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 200,
              child: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total Price: $price",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade800),
                    ),
                    Text(
                      "Total Items: $count",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade800),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 150,
              child: Center(
                child: MyButton(
                  label: "BUY",
                  onPressed: widget.onPressed,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
