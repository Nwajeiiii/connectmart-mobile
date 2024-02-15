import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> imageList = [
    'assets/images/png/special-promo.png',
    'assets/images/png/flash-sales.png',
    'assets/images/png/beauty-bonaza.png',
    'assets/images/png/discounted-prices.png',
  ];

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to get device width and calculate height
    double height = MediaQuery.of(context).size.width * (9 / 16); // 16:9 aspect ratio

    return Column(
      children: [
        SizedBox(
          height: height, // Set a fixed height for the PageView
          child: PageView.builder(
            controller: _pageController,
            itemCount: imageList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: Image.asset(
                  imageList[index],
                  fit: BoxFit.contain,
                ),
              );
            },
          ),
        ),
        SmoothPageIndicator(
          controller: _pageController,
          count: imageList.length,
          effect: const WormEffect(
            dotHeight: 8.0, // Smaller dot size
            dotWidth: 8.0, // Smaller dot size
            spacing: 4.0, // Reduced space between dots
            radius: 4.0, // Circular dots
            dotColor: Colors.grey,
            activeDotColor: Color(0xffEF374C),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
