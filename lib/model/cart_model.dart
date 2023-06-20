import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  // list of items on sale
  final List _shopItems = const [
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

  get shopItems => _shopItems;

  // add item to cart
  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
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
