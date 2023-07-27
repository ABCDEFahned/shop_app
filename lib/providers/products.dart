import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_5/providers/product.dart';
import 'package:http/http.dart' as http;

class Products with ChangeNotifier {
  List<Product> _item = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbE3gVIe4mfZC-2x2EO_h21rwpau1G8v1MAnMXF5iQluG9_LaL&s',
    ),
    Product(
        id: 'p2',
        title: 'Trousers',
        description: 'A nice pair of trousers.',
        price: 59.99,
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzcM2mPbMwPdhLk8ASkmMVFZwGT38yDt4qsRB6u1ptqPIvW0M&s'),
    Product(
        id: 'p3',
        title: 'yellow scarf',
        description: 'Warm and cosy - exactly what you need for a Winter',
        price: 19.99,
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5-JwFvoXOF7hmN6fO1KJSwll485nsCyhYKwvgJiQxQevmbeGB&s'),
    Product(
        id: 'p4',
        title: 'A pan',
        description: 'prepare any meal you want',
        price: 49.99,
        imageUrl:
            'https://m.media-amazon.com/images/I/71FSvGwdiiL._AC_UF1000,1000_QL80_.jpg')
  ];

  Product findById(String id) {
    return items.firstWhere((prod) => prod.id == id);
  }

  bool _showfavoriteOnly = false;

  List<Product> get items {
    if (_showfavoriteOnly) {
      return _item.where((proditem) => proditem.isfavourit).toList();
    }
    return [..._item];
  }

  List<Product> get FavouriItem {
    return _item.where((proditem) => proditem.isfavourit).toList();
  }

  // void showfavoritesOnly() {
  //  _showfavoriteOnly = true;
  //  notifyListeners();
  //}

  //void showAll() {
  // _showfavoriteOnly = false;
  // notifyListeners();
  // }
  void addProduct(Product product) {
  
    final newProduct = Product(
      title: product.title,
      description: product.description,
      price: product.price,
      imageUrl: product.imageUrl,
      id: DateTime.now().toString(),
    );
    _item.add(newProduct);
    notifyListeners();
  }

  void updateProduct(String id, Product newproduct) {
    final productIndex = _item.indexWhere((prod) => prod.id == id);
    if (productIndex >= 0) {
      _item[productIndex] = newproduct;
      notifyListeners();
    } else {
      print('...');
    }
  }

  void deleteProduct(String id) {
    _item.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}


 /* const url =
        'https://helpful-range-384900-default-rtdb.firebaseio.com/Products.json';
    http.post(url as Uri, body: json.encode({
      'title' : product.title,
      'price': product.price,
      'description': product.description,
      'imgUrl' : product.imageUrl,
      'isFavorit' : product.isfavourit
    }));*/