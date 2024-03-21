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

  Future<Map<String, dynamic>> uploadProduct(Map<String, dynamic> productData) async {
    final url = Uri.parse('http://10.0.2.2:8080/products/wholesale/add'); // Use 10.0.2.2 for Android emulator to access localhost
    final response = await http.post(url, body: json.encode(productData), headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to upload product');
    }
  }
}
