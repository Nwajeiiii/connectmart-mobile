// import 'package:hive/hive.dart';
//
// class CartService {
//   final Box box = Hive.box('cartBox');
//
//   Future<bool> addNewCart(String cartName) async {
//     try {
//       final carts = box.get('carts', defaultValue: <String>[]);
//       carts.add(cartName);
//       await box.put('carts', carts);
//       print('Cart added: $cartName');
//       return true;
//     } catch (e) {
//       print('Failed to add cart: $e');
//       return false;
//     }
//   }
//
//   List<String> getCarts() {
//     return box.get('carts', defaultValue: <String>[]);
//   }
//
//   Future<bool> addToCart(String cartName, dynamic product) async {
//     try {
//       // This example assumes you're adding a product ID or similar identifier
//       final cartItems = box.get(cartName, defaultValue: <dynamic>[]);
//       cartItems.add(product);
//       await box.put(cartName, cartItems);
//       print('Product added to cart: $cartName');
//       return true;
//     } catch (e) {
//       print('Failed to add product to cart: $e');
//       return false;
//     }
//   }
// }

import 'package:hive/hive.dart';

class CartService {
  final Box box = Hive.box('cartBox');

  Future<bool> addNewCart(String cartName, [dynamic firstProduct]) async {
    try {
      final carts = box.get('carts', defaultValue: <String>[]);
      if (!carts.contains(cartName)) {
        carts.add(cartName);
        await box.put('carts', carts);
        print('Cart added: $cartName');

        // Initialize the new cart with an empty list or the first product if provided
        await box.put(cartName, firstProduct != null ? [firstProduct] : <dynamic>[]);
        return true;
      }
      return false;
    } catch (e) {
      print('Failed to add cart: $e');
      return false;
    }
  }

  Future<bool> addToCart(String cartName, dynamic product) async {
    try {
      final cartItems = box.get(cartName, defaultValue: <dynamic>[]);
      cartItems.add(product);
      await box.put(cartName, cartItems);
      print('Product added to cart: $cartName');
      return true;
    } catch (e) {
      print('Failed to add product to cart: $e');
      return false;
    }
  }

  List<String> getCarts() {
    return box.get('carts', defaultValue: <String>[]);
  }

}
