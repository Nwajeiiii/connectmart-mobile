// upload_product_logic.dart
import 'package:flutter/material.dart';

import '../dashboard/dashboard.dart';
import '../services/product_service.dart';

class UploadProductHandler {
  final _apiService = ProductService();

  void uploadProduct(BuildContext context, Map<String, dynamic> productData) async {
    try {
      final response = await _apiService.uploadProduct(productData);
      if (response['responseCode'] == '000') {
        // Success
        print('Upload successful');
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Success'),
              content: Text('Product uploaded successfully!'),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(Dashboard.id, (Route<dynamic> route) => false);
                  },
                ),
              ],
            );
          },
        );
      } else {
        // Failure
        print('Upload failed with message: ${response['responseMessage']}');
        _showErrorDialog(context, response['responseMessage']);
      }
    } catch (e) {
      print('Exception caught: $e');
      _showErrorDialog(context, 'An error occurred. Please try again.');
    }
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
