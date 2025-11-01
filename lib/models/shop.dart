import 'package:flutter/material.dart';
import '../models/product.dart';

class Shop extends ChangeNotifier {
  final List<Product> _shop = [
    Product(
        name: "Product 1",
        price: 150.99,
        description: "Item description...",
        imagePath: "assets/product_1.jpg"),
    Product(
        name: "Product 2",
        price: 150.99,
        description: "Item description...",
        imagePath: "assets/product_2.jpg"),
    Product(
        name: "Product 3",
        price: 99.99,
        description: "Item description...",
        imagePath: "assets/product_3.jpg"),
    Product(
        name: "Product 4",
        price: 99.99,
        description: "Item description...",
        imagePath: "assets/product_4.png"),
    Product(
        name: "Product 5",
        price: 200.99,
        description: "Item description...",
        imagePath: "assets/product_6.jpg"),
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
