// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ItemTile extends StatelessWidget {
  // variables whose values would be required
  //from requesting context outside this widget
  final String itemName;
  final num itemPrice;
  final int itemCount;

  ItemTile(
      {super.key,
      required this.itemName,
      required this.itemPrice,
      required this.itemCount});

  // padding variables
  double tlrPadding = 20;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: 0, top: tlrPadding, left: tlrPadding, right: tlrPadding),
      child: SizedBox(
        height: 150,
        width: 150,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.green.shade100,
          ),
          padding: const EdgeInsets.all(12),

          // makes the ROW for elements of ItemTile
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // placeholder for images
              const SizedBox(
                height: 100,
                width: 100,
                child: Placeholder(),
              ),
              // for item name, prices, and quantity
              SizedBox(
                height: 100,
                width: 175,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // NAME
                    Text(
                      itemName,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    // for formatting purposes
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          // makes the price and count stacked
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // PRICE
                                Text(
                                  "₱$itemPrice/pc",
                                  style: const TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontSize: 18,
                                  ),
                                ),

                                // COUNT
                                Text('stock: $itemCount'),
                              ]),
                        ),
                        // ADD TO CART ICON
                        SizedBox(
                          child: Icon(Icons.add_shopping_cart_outlined),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
