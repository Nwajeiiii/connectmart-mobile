import 'package:connectmart/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../constants/screen_margins.dart';
import '../widgets/custom_button_styles.dart';
import 'payment_screen.dart';

class CartProductsScreen extends StatelessWidget {
  final String cartName;

  const CartProductsScreen({super.key, required this.cartName});

  @override
  Widget build(BuildContext context) {
    final products =
        Hive.box('cartBox').get(cartName, defaultValue: <dynamic>[]);
    // Compute the total number of products
    final int totalProducts = products.length;

    // Compute the total price of all products
    final double totalPrice =
        products.fold(0.0, (sum, item) => sum + item['productPrice']);
    print(products);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
          style: GoogleFonts.montserrat(),
        ),
        centerTitle: true,
      ),
      bottomSheet: Container(
        padding: kMainPageMargin,
        color: Colors.white,
        height: MediaQuery.of(context).size.height * 0.20,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total ($totalProducts item):'),
                Text('₦ $totalPrice'),
              ],
            ),
            ElevatedButton(
              style: kAuthenticationButtonStyle,
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PaymentScreen(cartName: cartName),
                ),
              ),
              child: Text(
                'Continue To Payment',
                style: kAuthenticationButtonTextStyle,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: kMainPageMargin,
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return Card(
              elevation: 5.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              // Adjust for spacing between cards
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(8.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                tileColor: Colors.white,
                title: Row(
                  children: [
                    Image.network(
                      product['photoLink'],
                      width: 60, // Adjust the image size
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 10),
                    // Adjust the spacing between image and text
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // Align text to the start
                        children: [
                          Text(
                            product['productName'],
                            style: GoogleFonts.montserrat(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          // Adjust the spacing between product name and price
                          Text(
                            '₦ ${product['productPrice']}',
                            style: GoogleFonts.montserrat(
                              color: Colors.grey, // Adjusted for price color
                              fontSize: 16.0, // Adjusted for price font size
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
