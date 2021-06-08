import 'package:flutter/material.dart';

class CartItems {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItems({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
  });
}

class Cart with ChangeNotifier {
  late Map<String, CartItems> _items = Map();

  Map<String, CartItems> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  void addItemsToCart(String title, String id, double price) {
    if (_items.containsKey(id)) {
      _items.update(
        id,
            (oldItem) => CartItems(
            id: oldItem.id,
            title: oldItem.title,
            quantity: oldItem.quantity + 1,
            price: oldItem.price),
      );
    } else {
      _items.putIfAbsent(
        id,
            () => CartItems(
            id: DateTime.now().toString(),
            title: title,
            quantity: 1,
            price: price),
      );
    }
    notifyListeners();
  }

  double get totalAmount{
    var total = 0.0;
    _items.forEach((key, value) {
      total += value.price * value.quantity;
    });

    return total;
  }
}
