import 'package:connectmart/constants/screen_margins.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'home_screen.dart';
import 'cart_screen.dart';
import 'profile_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  static String id = '/dashboard';

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var _currentIndex = 0;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Function to generate the widget options dynamically
  List<Widget> getWidgetOptions(VoidCallback openDrawer) => [
    HomeScreen(onDrawerButtonPressed: openDrawer),
    CartScreen(onDrawerButtonPressed: openDrawer),
    const ProfileScreen(),
  ];

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    // Generate widget options dynamically
    final widgetOptions = getWidgetOptions(_openDrawer);

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                leading: const Icon(Icons.home),
                title: Text('Home'),
                onTap: () => Navigator.of(context).pop(),
              ),
              ListTile(
                leading: Icon(Icons.shopping_cart),
                title: Text('Cart'),
                onTap: () => Navigator.of(context).pop(),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Profile'),
                onTap: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: kMainPageMargin, // Ensure you have the correct padding
          child: widgetOptions.elementAt(_currentIndex),
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

