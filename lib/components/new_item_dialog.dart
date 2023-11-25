import 'package:elibaps/components/my_button.dart';
import 'package:flutter/material.dart';

class NewItemDialog extends StatelessWidget {
  const NewItemDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.green.shade100,
      content: SizedBox(
        height: 250,
        child: Column(
          children: [
            // name input
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Name",
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),

            // price input
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Price",
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),

            // quantity input
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
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
                  myButton(
                    label: "Save",
                    onPressed: () {},
                  ),

                  // cancel button
                  myButton(
                    label: "Cancel",
                    onPressed: () {},
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
