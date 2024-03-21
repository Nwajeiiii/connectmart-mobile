import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:google_fonts/google_fonts.dart';

import '../logic_handlers/cart_handler.dart';

class ProductDetail extends StatelessWidget {
  final dynamic product; // Use a dynamic or a specific type if you have one

  ProductDetail({super.key, required this.product});

  final GlobalKey<AnimatorWidgetState> _basicAnimation1 =
  GlobalKey<AnimatorWidgetState>();
  final GlobalKey<AnimatorWidgetState> _basicAnimation2 =
  GlobalKey<AnimatorWidgetState>();
  final GlobalKey<AnimatorWidgetState> _basicAnimation3 =
  GlobalKey<AnimatorWidgetState>();
  final GlobalKey<AnimatorWidgetState> _basicAnimation4 =
  GlobalKey<AnimatorWidgetState>();
  final GlobalKey<AnimatorWidgetState> _basicAnimation5 =
  GlobalKey<AnimatorWidgetState>();
  final GlobalKey<AnimatorWidgetState> _basicAnimation6 =
  GlobalKey<AnimatorWidgetState>();
  final GlobalKey<AnimatorWidgetState> _basicAnimation7 =
  GlobalKey<AnimatorWidgetState>();
  final GlobalKey<AnimatorWidgetState> _basicAnimation8 =
  GlobalKey<AnimatorWidgetState>();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final appBarHeight = AppBar().preferredSize.height;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final availableHeight = screenHeight - appBarHeight - statusBarHeight;

    return SafeArea(
      child: Scaffold(
        bottomSheet: Container(
          color: Colors.white,
          height: 100.0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BounceInUp(
                      key: _basicAnimation1,
                      child: Text(
                        'Total Price',
                        style: GoogleFonts.montserrat(
                          fontSize: 16.0,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                    BounceInUp(
                      key: _basicAnimation2,
                      child: Text(
                        '₦ ${product['productPrice']}',
                        style: GoogleFonts.montserrat(
                          fontSize: 18.0,
                          color: Colors.grey[800],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                BounceInUp(
                  key: _basicAnimation3,
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor:
                      MaterialStatePropertyAll(Color(0xffEF374C)),
                      padding: MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 15, horizontal: 30)),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              10,
                            ),
                          ),
                        ),
                      ),
                    ),
                    onPressed: () => CartHandler(product: product).showAddToCartDialog(context),
                    child: Text(
                      'Add to Cart',
                      style: GoogleFonts.montserrat(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Stack(
          children: [
            Positioned(
              top: 0,
              // Aligns the second container to the top
              left: 0,
              right: 0,
              // Ensures the container takes the full width of the screen
              child: SizedBox(
                height: availableHeight * 0.6,
                child: Image.network(
                  product['photoLink'],
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            Positioned(
              bottom: 0, // Aligns the image container to the bottom
              left: 0,
              right: 0,
              child: Container(
                height: availableHeight * 0.6,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.elliptical(50, 50),
                    topRight: Radius.elliptical(50, 50),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 0,
                      blurRadius: 10,
                      offset:
                          const Offset(0, -2), // Elevation for the container
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BounceInDown(
                          key: _basicAnimation4,
                          child: Text(
                            product['productName'],
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        BounceInDown(
                          key: _basicAnimation5,
                          child: Text(
                            'Product Details',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        BounceInDown(
                          key: _basicAnimation6,
                          child: Text(
                            product['productDetails'],
                            style: GoogleFonts.montserrat(
                              color: Colors.grey[800],
                            ),
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        BounceInDown(
                          key: _basicAnimation7,
                          child: Text(
                            'Size: ${product['productSize']}',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        BounceInDown(
                          key: _basicAnimation8,
                          child: Text(
                            'Color: ${product['productColor']}',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        const Divider(),
                        // const Spacer(),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
