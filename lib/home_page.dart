import 'package:flutter/material.dart';

import 'components/item_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomePage> {
  // list of item stocks
  List listStocks = [
    ["ecok omsim", 18, 10],
    ["hisab al jab'r wa'l mughabala", 499, 3],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // builds the appbar
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.add_card_outlined), onPressed: () {}),
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          "Pabili",
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),

      // the button to add stocks

      // the body of the app
      // the main screen or something idk
      body: ListView.builder(
        itemCount: listStocks.length,
        itemBuilder: (context, index) {
          return ItemTile(
            itemName: listStocks[index][0],
            itemPrice: listStocks[index][1],
            itemCount: listStocks[index][2],
          );
        },
      ),
    );
  }
}
