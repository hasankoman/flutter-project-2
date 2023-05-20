import 'package:flutter/material.dart';
import '../models/product.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  void addItem(Product product) {
    print(product.id);
    if (_items.containsKey(product.id)) {
      _items.update(
        product.id,
        (existingCartItem) => CartItem(
          id: existingCartItem.id,
          product: existingCartItem.product,
          quantity: existingCartItem.quantity + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        product.id,
        () => CartItem(
          id: product.id,
          product: product,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void decreaseItemQuantity(String productId) {
    print(productId);
    if (_items.containsKey(productId)) {
      if (_items[productId]!.quantity == 1) {
        _items.remove(productId);
      } else {
        _items.update(
          productId,
          (existingCartItem) => CartItem(
            id: existingCartItem.id,
            product: existingCartItem.product,
            quantity: existingCartItem.quantity - 1,
          ),
        );
      }
      notifyListeners();
    }
  }

  void clearCart() {
    _items = {};
    notifyListeners();
  }

  double get totalAmount {
    return _items.values.fold(0.0, (sum, item) => sum + item.totalPrice);
  }
}

class CartItem {
  final String id;
  final Product product;
  int quantity;

  CartItem({
    required this.id,
    required this.product,
    required this.quantity,
  });

  double get totalPrice {
    return product.price * quantity.toDouble();
  }
}
