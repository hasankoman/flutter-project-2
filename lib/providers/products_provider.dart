import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductsProvider with ChangeNotifier {
  final db = FirebaseFirestore.instance;

  List<Product> _products = [];
  List<String> _categories = [];
  String _selectedCategory = '';

  List<Product> get products {
    return [..._products];
  }

  List<String> get categories {
    return [..._categories];
  }

  String get selectedCategory {
    return _selectedCategory;
  }

  Future<void> fetchProducts([String categoryName = 'All']) async {
    try {
      CollectionReference productsCollection =
          FirebaseFirestore.instance.collection('products');
      QuerySnapshot querySnapshot = await productsCollection.get();
      _products = querySnapshot.docs
          .map((doc) {
            final data = doc.data();
            if (data != null) {
              return Product.fromMap(data as Map<String, dynamic>);
            } else {
              return null;
            }
          })
          .where((product) =>
              product != null &&
              (categoryName == null ||
                  categoryName == "All" ||
                  product.category == categoryName))
          .cast<Product>()
          .toList();
      var allProduct = querySnapshot.docs
          .map((doc) {
            final data = doc.data();
            if (data != null) {
              return Product.fromMap(data as Map<String, dynamic>);
            } else {
              return null;
            }
          })
          .where((product) => product != null)
          .cast<Product>()
          .toList();
      _selectedCategory = categoryName;
      _categories =
          allProduct.map((product) => product.category).toSet().toList();
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
