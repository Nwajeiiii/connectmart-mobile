import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CartProductsScreen extends StatelessWidget {
  final String cartName;

  const CartProductsScreen({super.key, required this.cartName});

  @override
  Widget build(BuildContext context) {
    final products = Hive.box('cartBox').get(cartName, defaultValue: <dynamic>[]);

    return Scaffold(
      appBar: AppBar(
        title: Text('Products in $cartName'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text(product.toString()), // Assuming product is a simple data type for demonstration. Adjust as needed.
            // Add any additional product details or actions here.
          );
        },
      ),
    );
  }
}
