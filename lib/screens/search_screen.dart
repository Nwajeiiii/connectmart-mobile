import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../constants/screen_margins.dart';
import '../providers/product_provider.dart';
import 'product_details.dart';

class SearchScreen extends StatelessWidget {
  static String id = '/search-screen';

  SearchScreen({super.key});

  String shortenText(String text, int wordLimit) {
    final wordList = text.split(' ');
    if (wordList.length > wordLimit) {
      return '${wordList.sublist(0, wordLimit).join(' ')}...';
    }
    return text;
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Results'),
        centerTitle: true,
      ),
      body: productProvider.products.isNotEmpty
          ? Padding(
              padding: kMainPageMargin,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7, // Adjusted to prevent overflow
                ),
                itemBuilder: (BuildContext context, int index) {
                  final product = productProvider.products[index];
                  return Card(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ProductDetail(
                              product:
                                  product, // Pass the selected product to the ProductDetail screen
                            ),
                          ),
                        );
                      },
                      borderRadius: BorderRadius.circular(20),
                      child: BounceInDown(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),
                                child: ZoomInRight(
                                  child: Image.network(
                                    product['photoLink'],
                                    fit: BoxFit.cover,
                                    // You might want to adjust the height dynamically based on the content
                                    height: 100,
                                    // Fixed height for the image
                                    width: double.infinity,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: BounceInLeft(
                                  child: Text(
                                      shortenText(product['productName'], 6),
                                    style: theme.textTheme.titleMedium
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child: BounceInLeft(
                                  child: Text(
                                    shortenText(product['productDetails'], 7),
                                    style: theme.textTheme.bodySmall
                                        ?.copyWith(color: Colors.grey),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: BounceInLeft(
                                  child: Text(
                                    '₦${product['productPrice']}',
                                    style: theme.textTheme.titleMedium,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: productProvider.products.length,
              ),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: ZoomInUp(
                    child:
                        Image.asset('assets/images/png/search-not-found.png'),
                  ),
                ),
                const SizedBox(height: 10.0),
                Center(
                  child: ZoomInDown(
                    child: Text(
                      'No result found!',
                      style: GoogleFonts.montserrat(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
