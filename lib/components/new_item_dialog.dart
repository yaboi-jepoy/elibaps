// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:elibaps/components/my_button.dart';
import 'package:flutter/material.dart';

class NewItemDialog extends StatelessWidget {
  final nameController;
  final priceController;
  final quantityController;
  VoidCallback onSave;
  VoidCallback onCancel;

  NewItemDialog({
    super.key,
    required this.nameController,
    required this.priceController,
    required this.quantityController,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.green.shade100,
      content: SizedBox(
        height: 250,
        width: 250,
        child: Column(
          children: [
            // name input
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: "Name",
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),

            // price input
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: priceController,
                decoration: const InputDecoration(
                  hintText: "Price",
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),

            // quantity input
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: quantityController,
                decoration: const InputDecoration(
                  hintText: "Quantity",
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // save button
                  MyButton(
                    label: "Save",
                    onPressed: onSave,
                  ),

                  // cancel button
                  MyButton(
                    label: "Cancel",
                    onPressed: onCancel,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
