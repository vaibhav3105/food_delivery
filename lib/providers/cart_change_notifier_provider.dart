import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/cart_model.dart';

final cartNotifierProvider =
    ChangeNotifierProvider<CartItemNotifier>(((ref) => CartItemNotifier()));

class CartItemNotifier with ChangeNotifier {
  final Map<String, CartModel> _cartItems = {};

  Map<String, CartModel> get cartItems {
    Map<String, CartModel> temp = {};
    _cartItems.forEach((key, value) {
      if (value.quantity > 0) {
        temp[key] = value;
      }
    });
    return temp;
  }

  void addItem(
    String mealId,
    String name,
    String imageUrl,
    int price,
  ) {
    if (_cartItems.containsKey(mealId) && _cartItems[mealId]!.price != price) {
      _cartItems.putIfAbsent(
          DateTime.now().toString(),
          () => CartModel(
              id: DateTime.now().toString(),
              name: name,
              price: price,
              imageUrl: imageUrl,
              quantity: 1));
      notifyListeners();
    } else if (_cartItems.containsKey(mealId)) {
      _cartItems.update(
          mealId,
          (value) => CartModel(
              id: DateTime.now().toString(),
              name: name,
              price: value.price,
              imageUrl: imageUrl,
              quantity: value.quantity + 1));
      notifyListeners();
    } else {
      _cartItems.putIfAbsent(
          mealId,
          () => CartModel(
              id: DateTime.now().toString(),
              name: name,
              price: price,
              imageUrl: imageUrl,
              quantity: 1));
      notifyListeners();
    }
  }

  void increaseQuantity(String mealId) {
    _cartItems.update(
        mealId,
        (value) => CartModel(
            id: value.id,
            name: value.name,
            price: value.price,
            imageUrl: value.imageUrl,
            quantity: value.quantity + 1));
    notifyListeners();
  }

  void decreaseQuantity(String mealId) {
    _cartItems.update(
        mealId,
        (value) => CartModel(
            id: value.id,
            name: value.name,
            price: value.price,
            imageUrl: value.imageUrl,
            quantity: value.quantity - 1));
    notifyListeners();
  }

  double get totalAmount {
    double total = 0.0;
    _cartItems.forEach((key, value) {
      total += value.price * value.quantity;
    });
    return total;
  }
}
