// TODO Implement this library.
import 'package:flutter/material.dart';
import '../models/product.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}

class CartProvider extends ChangeNotifier {
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => {..._items};

  int get itemCount {
    var total = 0;
    for (var item in _items.values) {
      total += item.quantity;
    }
    return total;
  }

  void addProduct(Product product) {
    if (_items.containsKey(product.id)) {
      _items[product.id]!.quantity += 1;
    } else {
      _items[product.id] = CartItem(product: product, quantity: 1);
    }
    notifyListeners();
  }

  void increaseQuantity(String productId) {
    if (_items.containsKey(productId)) {
      _items[productId]!.quantity += 1;
      notifyListeners();
    }
  }

  void decreaseQuantity(String productId) {
    if (!_items.containsKey(productId)) return;
    final existing = _items[productId]!;
    if (existing.quantity > 1) {
      existing.quantity -= 1;
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }

  void removeProduct(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  double get totalAmount {
    var total = 0.0;
    for (var item in _items.values) {
      total += item.product.price * item.quantity;
    }
    return total;
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
