import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/screen_margins.dart';
import 'upload_product_details_screen.dart';

class UploadProductScreen extends StatelessWidget {
  const UploadProductScreen({super.key});

  static String id = 'upload-product-screen';

  static const _productsNameList = [
    'Shoes',
    'Wrist-Watches',
    'Dresses',
    'Pants',
    'Shirts',
    'Skirts'
  ];
  static const _productsImagePathList = [
    'https://cartnear.s3.us-east-2.amazonaws.com/ng/38a88c7fa6adff61a680bd3579c3af2e.jpg',
    'https://img.joomcdn.net/4a0e2a0766a61914078fbd62e1ded3856a2e5315_original.jpeg',
    'https://viniodresses.com/cdn/shop/products/navy-blue-tulle-homecoming-dresses-spaghetti-strap-short-prom-dress-sd1586-prom-dresses-viniodress-navy-blue-custom-size.jpg?v=1670386169',
    'https://www.marsgear.com/cdn/shop/products/condor-sentinel-tactical-pants-plus-size-mars-gear-6_800x.jpg?v=1667601393',
    'https://addide.com/cdn/shop/files/Sf1b71c7015324d9da9a0aac75eb42c40M_1024x.jpg?v=1689170974',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRh9w0pZEkvrIQwvHiAEdHu0W6pjFhVnS-9Eg&usqp=CAU',
  ];

  List<InkWell> _populateGrid(context) {
    return List.generate(
      6,
      (index) => InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UploadProductDetailsScreen(
              productType: _productsNameList[index].toLowerCase(),
            ),
          ),
        ),
        child: SlideInRight(
          child: Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Column(
                children: [
                  Expanded(
                    child: BounceInDown(
                      child: Container(
                        color: Colors.white, // Set the background color here
                        child: Image.network(
                          _productsImagePathList[index],
                          fit: BoxFit.cover,
                          width: double
                              .infinity, // Adjust the image to cover the space
                        ),
                      ),
                    ),
                  ),
                  BounceInDown(
                    child: Container(
                      width: double.infinity,
                      color: Colors.white,
                      // Also set the background color for the text part
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        _productsNameList[index],
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Products', style: GoogleFonts.montserrat()),
        centerTitle: true,
      ),
      body: Container(
        margin: kMainPageMargin,
        child: Column(
          children: [
            BounceInDown(
              child: Text(
                'Choose the product you wish to upload!',
                style: GoogleFonts.montserrat(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 20.0,
                crossAxisSpacing: 10.0,
                children: _populateGrid(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
