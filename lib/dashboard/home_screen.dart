import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../logic_handlers/search_handler.dart';
import '../widgets/shared_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
    required this.onDrawerButtonPressed, // Now receives the function
  }) : super(key: key);

  final VoidCallback onDrawerButtonPressed;

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
  final TextEditingController _searchController = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.width * (9 / 16);

    return SingleChildScrollView(
      child: Column(
        children: [
          SharedHeader(
            basicAnimation1: GlobalKey<AnimatorWidgetState>(),
            basicAnimation2: GlobalKey<AnimatorWidgetState>(),
            basicAnimation3: GlobalKey<AnimatorWidgetState>(),
            basicAnimation4: GlobalKey<AnimatorWidgetState>(),
            searchController: _searchController,
            onMenuPressed: widget.onDrawerButtonPressed,
          ),
          SlideInDown(
            key: _basicAnimation1,
            child: SizedBox(
              height: height,
              child: PageView.builder(
                controller: _pageController,
                itemCount: imageList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: Image.asset(imageList[index], fit: BoxFit.contain),
                  );
                },
              ),
            ),
          ),
          SmoothPageIndicator(
            controller: _pageController,
            count: imageList.length,
            effect: const WormEffect(
              dotHeight: 8.0,
              dotWidth: 8.0,
              spacing: 4.0,
              radius: 4.0,
              dotColor: Colors.grey,
              activeDotColor: Color(0xffEF374C),
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SlideInLeft(
                key: _basicAnimation2,
                child: InkWell(
                  onTap: () => SearchHandler.executeSearch(context, 'shirts'),
                  child: Column(
                    children: [
                      Image.asset('assets/images/png/shirts.png'),
                      Text('Shirts', style: GoogleFonts.montserrat())
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 30),
              SlideInDown(
                key: _basicAnimation3,
                child: InkWell(
                  onTap: () => SearchHandler.executeSearch(context, 'dresses'),
                  child: Column(
                    children: [
                      Image.asset('assets/images/png/dresses.png'),
                      Text('Dresses', style: GoogleFonts.montserrat())
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 30),
              SlideInRight(
                key: _basicAnimation4,
                child: InkWell(
                  onTap: () => SearchHandler.executeSearch(context, 'dresses'),
                  child: Column(
                    children: [
                      Image.asset('assets/images/png/dresses.png'),
                      Text('Dresses', style: GoogleFonts.montserrat())
                    ],
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SlideInLeft(
                key: _basicAnimation5,
                child: InkWell(
                  onTap: () => SearchHandler.executeSearch(context, 'pants'),
                  child: Column(
                    children: [
                      Image.asset('assets/images/png/pants.png'),
                      Text('Pants', style: GoogleFonts.montserrat())
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 30),
              SlideInUp(
                key: _basicAnimation6,
                child: InkWell(
                  onTap: () => SearchHandler.executeSearch(context, 'skirts'),
                  child: Column(
                    children: [
                      Image.asset('assets/images/png/skirts.png'),
                      Text('Skirts', style: GoogleFonts.montserrat())
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 30),
              SlideInRight(
                key: _basicAnimation7,
                child: InkWell(
                  onTap: () => SearchHandler.executeSearch(context, 'dresses'),
                  child: Column(
                    children: [
                      Image.asset('assets/images/png/dresses.png'),
                      Text('Dresses', style: GoogleFonts.montserrat())
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
