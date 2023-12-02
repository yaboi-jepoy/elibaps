// ignore_for_file: unused_field

import 'package:elibaps/components/bottom_ui.dart';
import 'package:elibaps/components/new_item_dialog.dart';
import 'package:elibaps/components/receipt.dart';
import 'package:elibaps/data/database.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'components/item_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomePage> {
  // reference the hive box
  StocksDatabase sb = StocksDatabase();
  final _myBox = Hive.box('myBox');

  @override
  void initState() {
    // if first time buksan
    if (_myBox.get("STOCKS") == null) {
      sb.createInitialData();
    } else {
      sb.loadData();
    }
    super.initState();
  }

  // text controllers
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _quantityController = TextEditingController();

  // cart variables
  num cartTotal = 0;
  num cartCount = 0;

  // save new items
  void saveNewItem() {
    setState(() {
      sb.listStocks.add([
        _nameController.text,
        num.tryParse(_priceController.text),
        int.tryParse(_quantityController.text),
      ]);
      clearController();
      Navigator.of(context).pop();
    });

    sb.updateData();
  }

  // on add to cart functionality
  void addToCart(int index) {
    setState(() {
      // code
      if (sb.listStocks[index][2] != 0) {
        sb.listStocks[index][2] -= 1;

        // updates the cart value
        cartCount += 1;
        cartTotal += sb.listStocks[index][1];
      }
    });
  }

  // prints receipt
  Future<void> printReceipt() async {
    showDialog(
        context: context,
        builder: (context) {
          return ReceiptDialog(bought: cartCount, amount: cartTotal);
        });

    await Future.delayed(
      const Duration(milliseconds: 100),
    );

    sb.updateData();
    clearCart();
  }

  // clears cart
  void clearCart() {
    setState(() {
      cartTotal = 0;
      cartCount = 0;
    });
  }

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
        itemCount: sb.listStocks.length,
        itemBuilder: (context, index) {
          return ItemTile(
            itemName: sb.listStocks[index][0],
            itemPrice: sb.listStocks[index][1],
            itemCount: sb.listStocks[index][2],
            addToCart: () => addToCart(index),
          );
        },
      ),

      // the thing at the bottom
      bottomNavigationBar: BottomUI(
        itemText: cartCount,
        priceText: cartTotal,
        onPressed: printReceipt,
      ),
    );
  }

  void clearController() {
    _nameController.clear();
    _priceController.clear();
    _quantityController.clear();
  }
}
