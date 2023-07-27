import 'package:flutter/material.dart';
import 'package:flutter_application_5/providers/Cart.dart';

class OrderItems {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItems(
      {required this.id,
      required this.amount,
      required this.products,
      required this.dateTime});
}

class Orders with ChangeNotifier {
  List<OrderItems> _orders = [];
  List<OrderItems> get orders {
    return [..._orders];
  }

  void addorder(List<CartItem> cartProduct, double total) {
    _orders.insert(
        0,
        OrderItems(
            id: DateTime.now().toString(),
            amount: total,
            dateTime: DateTime.now(),
            products: cartProduct));

    notifyListeners();
  }
}
