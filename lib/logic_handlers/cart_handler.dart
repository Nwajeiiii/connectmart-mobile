import 'package:flutter/material.dart';
import '../hive_services/cart_service.dart'; // Make sure this import path matches your project structure

class CartHandler {
  final dynamic product;

  CartHandler({required this.product});

  Future<void> showAddToCartDialog(BuildContext context) async {
    final cartService = CartService();
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add to Cart'),
          content: const Text('Do you want to create a new cart or add to an existing one?'),
          actions: [
            TextButton(
              child: const Text('New Cart'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                _showNewCartDialog(context, cartService);
              },
            ),
            TextButton(
              child: const Text('Existing Cart'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                _showExistingCartsDialog(context, cartService);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showNewCartDialog(BuildContext context, CartService cartService) async {
    TextEditingController cartNameController = TextEditingController();
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('New Cart'),
          content: TextField(
            controller: cartNameController,
            decoration: const InputDecoration(hintText: "Enter cart name"),
          ),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () async {
                final cartName = cartNameController.text.trim(); // Trim whitespace
                if (cartName.isEmpty || cartName.toLowerCase() == 'carts') {
                  // Show an error message if the cart name is 'carts'
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Invalid cart name. Please choose a different name.'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                } else if (await cartService.addNewCart(cartName)) {
                  Navigator.of(context).pop(); // Close the new cart dialog
                  _showSuccessDialog(context, 'Successfully saved to $cartName');
                } else {
                  // This branch might run if, for example, a cart with the same name already exists
                  Navigator.of(context).pop(); // Close the new cart dialog
                  _showFailureDialog(context, 'Failed to save to cart');
                }
              },
            ),
          ],
        );
      },
    );
  }



  Future<void> _showExistingCartsDialog(BuildContext context, CartService cartService) async {
    final carts = cartService.getCarts();
    if (carts.isEmpty) {
      _showNoCartsDialog(context);
    } else {
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Choose Cart'),
            content: SizedBox(
              width: double.maxFinite,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: carts.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(carts[index]),
                    onTap: () async {
                      if (await cartService.addToCart(carts[index], product)) {
                        Navigator.of(context).pop(); // Close the existing carts dialog
                        _showSuccessDialog(context, 'Successfully added to ${carts[index]}');
                      } else {
                        Navigator.of(context).pop(); // Close the existing carts dialog
                        _showFailureDialog(context, 'Could not add to ${carts[index]}');
                      }
                    },
                  );
                },
              ),
            ),
          );
        },
      );
    }
  }

  void _showSuccessDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Success'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showFailureDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Failure'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showNoCartsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('No Existing Carts'),
          content: const Text('You do not have any existing carts. Would you like to create a new one?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the no carts dialog
                final cartService = CartService();
                _showNewCartDialog(context, cartService); // Directly go to create new cart dialog
              },
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('No'),
            ),
          ],
        );
      },
    );
  }
}
