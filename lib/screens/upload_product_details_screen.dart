import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/screen_margins.dart';
import '../constants/text_styles.dart';
import '../logic_handlers/upload_product_handler.dart';
import '../widgets/custom_button_styles.dart';
import '../widgets/custom_input_decoration.dart';

class UploadProductDetailsScreen extends StatelessWidget {
  UploadProductDetailsScreen({
    super.key,
    required this.productType,
  });

  final String productType;

  final _productNameController = TextEditingController();
  final _productSizeController = TextEditingController();
  final _productColorController = TextEditingController();
  final _productPriceController = TextEditingController();
  final _productPhotoLinkController = TextEditingController();
  final _productDetailsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Products', style: GoogleFonts.montserrat()),
        centerTitle: true,
      ),
      body: Container(
        margin: kMainPageMargin,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ZoomInDown(
                child: Text(
                  'Product Name',
                  style: kBoldBigBlackFontStyle,
                ),
              ),
              const SizedBox(height: 10),
              BounceInDown(
                child: TextField(
                  controller: _productNameController,
                  decoration: kCustomInputDecoration(
                      hintText: 'Enter your product name'),
                ),
              ),
              const SizedBox(height: 15),
              ZoomInDown(
                child: Text(
                  'Product Size',
                  style: kBoldBigBlackFontStyle,
                ),
              ),
              const SizedBox(height: 10),
              BounceInDown(
                child: TextField(
                  controller: _productSizeController,
                  decoration: kCustomInputDecoration(
                      hintText: 'Enter your product size'),
                ),
              ),
              const SizedBox(height: 15),
              ZoomInDown(
                child: Text(
                  'Product Color',
                  style: kBoldBigBlackFontStyle,
                ),
              ),
              const SizedBox(height: 10),
              BounceInDown(
                child: TextField(
                  controller: _productColorController,
                  decoration: kCustomInputDecoration(
                      hintText: 'Enter your product color'),
                ),
              ),
              const SizedBox(height: 15),
              ZoomInDown(
                child: Text(
                  'Product Price',
                  style: kBoldBigBlackFontStyle,
                ),
              ),
              const SizedBox(height: 10),
              BounceInDown(
                child: TextField(
                  controller: _productPriceController,
                  decoration: kCustomInputDecoration(
                      hintText: 'Enter your product price'),
                ),
              ),
              const SizedBox(height: 15),
              ZoomInDown(
                child: Text(
                  'Product Photo Link',
                  style: kBoldBigBlackFontStyle,
                ),
              ),
              const SizedBox(height: 10),
              BounceInDown(
                child: TextField(
                  controller: _productPhotoLinkController,
                  decoration:
                      kCustomInputDecoration(hintText: 'Enter your photo link'),
                ),
              ),
              const SizedBox(height: 15),
              ZoomInDown(
                child: Text(
                  'Product Details',
                  style: kBoldBigBlackFontStyle,
                ),
              ),
              const SizedBox(height: 10),
              BounceInDown(
                child: TextField(
                  controller: _productDetailsController,
                  decoration: kCustomInputDecoration(
                      hintText: 'Enter your product details'),
                ),
              ),
              const SizedBox(height: 30),
              ZoomInUp(
                child: ElevatedButton(
                  style: kAuthenticationButtonStyle,
                  onPressed: () {
                    final productData = {
                      "photoLink": _productPhotoLinkController.text,
                      "productName": _productNameController.text,
                      "productCategory": productType,
                      // From the class variable
                      "productPrice":
                          int.tryParse(_productPriceController.text) ?? 0,
                      // Convert to int
                      "productDetails": _productDetailsController.text,
                      "productRating": 3.0,
                      // Static value
                      "productSize":
                          double.tryParse(_productSizeController.text) ?? 0.0,
                      // Convert to double
                      "productColor": _productColorController.text,
                    };
                    UploadProductHandler().uploadProduct(context, productData);
                  },
                  child: BounceInUp(
                    child: Text(
                      'Upload Product',
                      style: kAuthenticationButtonTextStyle,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
