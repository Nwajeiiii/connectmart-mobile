// Import necessary packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import '../screens/search_screen.dart';

class SearchHandler {
  // This method executes the search operation.
  // It requires context and the search query as parameters.
  static Future<void> executeSearch(BuildContext context, String query) async {
    final provider = Provider.of<ProductProvider>(context, listen: false);
    try {
      await provider.fetchProducts(query);
      Navigator.pushNamed(context, SearchScreen.id);
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Could not search. Please try again later.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      );
    }
  }
}
