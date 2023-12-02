import 'package:elibaps/components/bottom_ui.dart';
import 'package:elibaps/components/new_item_dialog.dart';
import 'package:flutter/material.dart';

import 'components/item_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomePage> {
  // text controllers
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _quantityController = TextEditingController();

  // cart variables
  num cartTotal = 0;
  num cartCount = 0;

  // list of item stocks
  List listStocks = [
    ["ecok omsim", 18, 100],
    ["hisab al jab'r wa'l mughabala", 499, 50],
  ];

  // save new items
  void saveNewItem() {
    setState(() {
      listStocks.add([
        _nameController.text,
        num.tryParse(_priceController.text),
        int.tryParse(_quantityController.text),
      ]);
      clearController();
      Navigator.of(context).pop();
    });
  }

  // on add to cart functionality
  void addToCart(int index) {
    setState(() {
      // code
      if (listStocks[index][2] != 0) {
        listStocks[index][2] -= 1;

        // updates the cart value
        cartCount += 1;
        cartTotal += listStocks[index][1];
      }
    });
  }

  // add to receipt function

  // method to add new items
  void addNewItem() {
    showDialog(
      context: context,
      builder: (context) {
        return NewItemDialog(
            nameController: _nameController,
            priceController: _priceController,
            quantityController: _quantityController,
            onSave: saveNewItem,
            onCancel: () {
              Navigator.of(context).pop();
              clearController();
            });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // builds the appbar
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.add_card_outlined),
          onPressed: () {
            addNewItem();
          },
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          "Pabili",
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),

      // the body of the app
      // the main screen or something idk
      body: ListView.builder(
        itemCount: listStocks.length,
        itemBuilder: (context, index) {
          return ItemTile(
            itemName: listStocks[index][0],
            itemPrice: listStocks[index][1],
            itemCount: listStocks[index][2],
            addToCart: () => addToCart(index),
          );
        },
      ),

      // the thing at the bottom
      bottomNavigationBar: BottomUI(
        itemText: cartCount,
        priceText: cartTotal,
      ),
    );
  }

  void clearController() {
    _nameController.clear();
    _priceController.clear();
    _quantityController.clear();
  }
}
