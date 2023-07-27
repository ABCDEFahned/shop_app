import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isfavourit;

  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.imageUrl,
      this.isfavourit = false});
  void toggleFavoritStatus() {
    isfavourit = !isfavourit;
    notifyListeners();
  }
}
