// INSIDE BUILDER
// if (snapshot.hasData) {

//           // Handle the data when it arrives
//           // Access the documents through snapshot.data.docs

//           return Text('Data received: ${snapshot.data.docs.length} documents');
//         } else if (snapshot.hasError) {
//           // Handle the error case
//           return Text('Error: ${snapshot.error}');
//         } else {
//           // Handle the initial loading state
//           return CircularProgressIndicator();
//         }
// END INSIDE BUILDER
//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class CartModel extends ChangeNotifier {
  // list of items on sale

  // final List _shooItems = const [];

  // ...

  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('products').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        final products = snapshot.data!.docs;
        List<List<dynamic>> shopItems = [];

        return ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index].data() as Map<String, dynamic>;
            final itemName = product['name'] as String;
            final itemPrice = product['price'] as int;
            final imageUrl = product['image'] as String;

            List<dynamic> item = [
              itemName,
              itemPrice,
              imageUrl,
              Color.fromARGB(14, 74, 25, 146)
            ];
            shopItems.add(item);

            // return ListTile(
            //   //leading: Image.asset('lib/images/banana.png'),
            //   leading: Image.network(imageUrl),
            //   title: Text(itemName),
            //   subtitle: Text('Price: Ksh $itemPrice'),
            // );
          },
        );
      },
    );
  }

  /* ************************************************************************************************************************* */
  final List _shopItem = const [
    // [ itemName, itemPrice, imagePath, color ]
    ["Avocado", "40.00", "lib/images/avocado.png", Colors.green],
    ["Banana", "30.00", "lib/images/banana.png", Colors.yellow],
    ["Chicken", "580.00", "lib/images/chicken.png", Colors.brown],
    ["Water", "150.00", "lib/images/water.png", Colors.blue],
    ["Ova", "50.00", "lib/images/avocado.png", Colors.redAccent],
    ["Chicken", "580.00", "lib/images/chicken.png", Colors.pink],
    ["Chicken", "580.00", "lib/images/chicken.png", Colors.pink],
  ];

  // list of cart items
  List _cartItems = [];

  get cartItems => _cartItems;

  //get shopItems => _shopItems;
  get shopItems => shopItems;

  // add item to cart
  void addItemToCart(int index) {
    //_cartItems.add(_shopItems[index]);
    _cartItems.add(shopItems[index]);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  // calculate total price
  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < cartItems.length; i++) {
      totalPrice += double.parse(cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
