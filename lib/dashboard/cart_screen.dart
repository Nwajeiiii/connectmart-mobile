// import 'package:flutter/material.dart';
// import 'package:hive_flutter/adapters.dart';
//
// import '../screens/cart_products_screen.dart';
//
// class CartScreen extends StatelessWidget {
//   const CartScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder(
//       valueListenable: Hive.box('cartBox').listenable(),
//       builder: (context, Box box, _) {
//         // Fetch all keys (which includes cart names and the 'carts' meta-entry)
//         final keys = box.keys.cast<String>().toList();
//
//         // Filter out the 'carts' key to avoid displaying it
//         final filteredKeys = keys.where((key) => key != 'carts').toList();
//
//         if (filteredKeys.isEmpty) {
//           return Center(child: Text('No carts available.'));
//         }
//
//         return ListView.builder(
//           itemCount: filteredKeys.length,
//           itemBuilder: (context, index) {
//             final cartName = filteredKeys[index];
//             return ListTile(
//               title: Text(cartName),
//               onTap: () => Navigator.push(context, MaterialPageRoute(
//                 builder: (_) => CartProductsScreen(cartName: cartName),
//               )),
//               trailing: IconButton(
//                 icon: Icon(Icons.delete),
//                 onPressed: () {
//                   // Here, also handle the removal of the cart name from the 'carts' list
//                   // when a cart is deleted
//                   final cartsList = box.get('carts', defaultValue: <String>[])..remove(cartName);
//                   box.put('carts', cartsList);
//                   box.delete(cartName);
//                 },
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_animator/widgets/animator_widget.dart';
import 'package:hive_flutter/adapters.dart';

import '../screens/cart_products_screen.dart';
import '../widgets/shared_header.dart';

class CartScreen extends StatelessWidget {
  CartScreen({
    Key? key,
    required this.onDrawerButtonPressed,
  }) : super(key: key);

  final VoidCallback onDrawerButtonPressed;

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SharedHeader(
          basicAnimation1: GlobalKey<AnimatorWidgetState>(),
          basicAnimation2: GlobalKey<AnimatorWidgetState>(),
          basicAnimation3: GlobalKey<AnimatorWidgetState>(),
          basicAnimation4: GlobalKey<AnimatorWidgetState>(),
          searchController: _searchController,
          onMenuPressed: () => onDrawerButtonPressed(),
        ),
        Expanded(
          child: ValueListenableBuilder(
            valueListenable: Hive.box('cartBox').listenable(),
            builder: (context, Box box, _) {
              final keys = box.keys.cast<String>().toList();
              final filteredKeys = keys.where((key) => key != 'carts').toList();

              if (filteredKeys.isEmpty) {
                return const Center(child: Text('No carts available.'));
              }

              return ListView.builder(
                itemCount: filteredKeys.length,
                itemBuilder: (context, index) {
                  final cartName = filteredKeys[index];
                  return ListTile(
                    title: Text(cartName),
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              CartProductsScreen(cartName: cartName),
                        )),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        final cartsList = box
                            .get('carts', defaultValue: <String>[])
                          ..remove(cartName);
                        box.put('carts', cartsList);
                        box.delete(cartName);
                      },
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

