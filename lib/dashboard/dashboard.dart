import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../constants/screen_margins.dart';
import '../logic_handlers/search_handler.dart';
import 'cart_screen.dart';
import 'favorites_screen.dart';
import 'home_screen.dart';
import 'profile_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  static String id = '/dashboard';

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final TextEditingController _searchController = TextEditingController();
  var _currentIndex = 0;
  final _widgetOptions = [
    HomeScreen(),
    FavoritesScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

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
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        drawer: Drawer(
          child: ListView(
            children: [],
          ),
        ),
        body: Padding(
          padding: kMainPageMargin,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: BounceInDown(
                      key: _basicAnimation1,
                      child: const Icon(Icons.menu, color: Colors.black),
                    ),
                    onPressed: () => scaffoldKey.currentState?.openDrawer(),
                  ),
                  BounceInDown(
                    key: _basicAnimation2,
                    child: Text(
                      'ConnectMart',
                      style: GoogleFonts.montserrat(
                        color: const Color(0xffEF374C),
                        fontSize: 28.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  IconButton(
                    style: const ButtonStyle(
                      backgroundColor:
                      MaterialStatePropertyAll(Color(0xfff9afb7)),
                    ),
                    onPressed: () {},
                    icon: BounceInDown(
                      key: _basicAnimation3,
                      child: const Icon(
                        Icons.notifications,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              BounceInDown(
                key: _basicAnimation4,
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText:
                    'Search for clothes, watches, bags, phones and whatever you want !',
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xfff6d1d5), // Default border color
                        width: 1.0, // Set the width as needed
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xfff6d1d5),
                        // Focused border color, can be different
                        width: 2.0, // Usually slightly thicker than default
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: IconButton(
                      onPressed: () async =>
                      await SearchHandler.executeSearch(
                        context,
                        _searchController.text,
                      ),
                      icon: const Icon(Icons.search_sharp,
                          color: Color(0xfff6d1d5)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Expanded(child: _widgetOptions.elementAt(_currentIndex)),
            ],
          ),
        ),
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          items: [
            SalomonBottomBarItem(
              icon: BounceInUp(
                key: _basicAnimation5,
                child: const Icon(Icons.home),
              ),
              title: const Text('Home'),
              selectedColor: const Color(0xffEF374C),
            ),
            SalomonBottomBarItem(
              icon: BounceInUp(
                key: _basicAnimation6,
                child: const Icon(Icons.favorite_border),
              ),
              title: const Text('Favorites'),
              selectedColor: const Color(0xffEF374C),
            ),
            SalomonBottomBarItem(
              icon: BounceInUp(
                key: _basicAnimation7,
                child: const Icon(Icons.shopping_cart_outlined),
              ),
              title: const Text('Cart'),
              selectedColor: const Color(0xffEF374C),
            ),
            SalomonBottomBarItem(
              icon: BounceInUp(
                key: _basicAnimation8,
                child: const Icon(Icons.person),
              ),
              title: const Text('Profile'),
              selectedColor: const Color(0xffEF374C),
            ),
          ],
        ),
      ),
    );
  }
}
