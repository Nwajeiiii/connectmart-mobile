import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_animator/widgets/animator_widget.dart';
import 'package:provider/provider.dart';

import '../providers/product_provider.dart';
import 'product_details.dart';

class SearchScreen extends StatelessWidget {
  static String id = '/search-screen';

  SearchScreen({super.key});

  final GlobalKey<AnimatorWidgetState> _basicAnimation1 =
      GlobalKey<AnimatorWidgetState>();
  final GlobalKey<AnimatorWidgetState> _basicAnimation2 =
      GlobalKey<AnimatorWidgetState>();
  final GlobalKey<AnimatorWidgetState> _basicAnimation3 =
      GlobalKey<AnimatorWidgetState>();
  final GlobalKey<AnimatorWidgetState> _basicAnimation4 =
      GlobalKey<AnimatorWidgetState>();

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
          ? ListView.builder(
              itemCount: productProvider.products.length,
              itemBuilder: (context, index) {
                final product = productProvider.products[index];
                return BounceInDown(
                  key: _basicAnimation1,
                  child: Card(
                    elevation: 4.0,
                    margin: const EdgeInsets.all(8.0),
                    child: InkWell(
                      // Use InkWell for a visual feedback on tap
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
                      child: ListTile(
                        // ListTile content remains the same
                        title: BounceInLeft(
                          key: _basicAnimation2,
                          child: Text(product['productName']),
                        ),
                        subtitle: BounceInLeft(
                          key: _basicAnimation3,
                          child: Text(product['productDetails']),
                        ),
                        trailing: BounceInRight(
                          key: _basicAnimation4,
                          child: Text('₦${product['productPrice']}'),
                        ),
                      ),
                    ),
                  ),
                );
              },
            )
          : Center(
              // This widget is displayed when the list is empty
              child: Text(
                'No results found',
                style: theme.textTheme.headlineSmall, // Customize as needed
              ),
            ),
    );
  }
}
