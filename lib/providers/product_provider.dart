import 'package:flutter/foundation.dart';

import '../services/product_service.dart';

class ProductProvider with ChangeNotifier {
  List<dynamic> _products = [];
  final ProductService _productService = ProductService();

  List<dynamic> get products => _products;


  Future<void> fetchProducts(String query) async {
    try {
      final response = await _productService.searchProducts(query);
      _products = response;
      notifyListeners();
    } catch (e, stacktrace) { // Updated catch block to capture and print stack trace
      print('Error fetching products: $e');
      print('Stacktrace: $stacktrace'); // Print the stack trace for more details
      throw Exception('Could not fetch products');
    }
  }


}
