import 'package:flutter/material.dart';
import 'package:fshop/models/product.dart';

class Shop extends ChangeNotifier {
  final List<Product> _shop = [
    Product(
      name: 'Product 1',
      price: 99.99,
      description: 'Item 1 description',
      imagePath: '/lib/images/shopping_2.webp',
    ),
    Product(
      name: 'Product 2',
      price: 199.99,
      description: 'Item 2 description',
      imagePath: '/lib/images/shopping_2.webp',
    ),
    Product(
      name: 'Product 3',
      price: 169.99,
      description: 'Item 3 description',
      imagePath: '/lib/images/shopping_2.webp',
    ),
    Product(
      name: 'Product 4',
      price: 99.99,
      description: 'Item 4 description',
      imagePath: '/lib/images/shopping_2.webp',
    ),
  ];

  final List<Product> _cart = [];
  List<Product> get shop => _shop;
  List<Product> get cart => _cart;

  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
