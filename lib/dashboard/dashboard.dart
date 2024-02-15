import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../constants/screen_margins.dart';
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
  var _currentIndex = 0;
  final _widgetOptions = [
    HomeScreen(),
    FavoritesScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

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
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.menu, color: Colors.black),
                      onPressed: () => scaffoldKey.currentState?.openDrawer(),
                    ),
                    Text(
                      'ConnectMart',
                      style: GoogleFonts.montserrat(
                        color: const Color(0xffEF374C),
                        fontSize: 28.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    IconButton(
                      style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Color(0xfff9afb7)),
                      ),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                TextField(
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
                      onPressed: () {},
                      icon: const Icon(Icons.search_sharp,
                          color: Color(0xfff6d1d5)),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.filter_list_sharp,
                          color: Color(0xfff6d1d5)),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                _widgetOptions.elementAt(_currentIndex),
              ],
            ),
          ),
        ),
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          items: [
            SalomonBottomBarItem(
              icon: const Icon(Icons.home),
              title: const Text('Home'),
              selectedColor: const Color(0xffEF374C),
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.favorite_border),
              title: const Text('Favorites'),
              selectedColor: const Color(0xffEF374C),
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.shopping_cart_outlined),
              title: const Text('Cart'),
              selectedColor: const Color(0xffEF374C),
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.person),
              title: const Text('Profile'),
              selectedColor: const Color(0xffEF374C),
            ),
          ],
        ),
      ),
    );
  }
}
