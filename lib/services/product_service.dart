import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductService {
  final String baseUrl = "http://10.0.2.2:8080/products/search";

  Future<List<dynamic>> searchProducts(String query) async {
    final response = await http.get(
      Uri.parse('$baseUrl/$query'),
      headers: {
        'Content-Type': 'application/json', // Specify content type as JSON
        // Add any other required headers here
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load products');
    }
  }
}
