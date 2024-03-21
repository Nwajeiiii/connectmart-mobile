import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

import '../screens/edit_profile_screen.dart';
import '../screens/upload_product_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Future<String> getUserType() async {
    var box = await Hive.openBox('userBox');
    final userData = box.get('user');
    if (userData != null && userData.containsKey('userType')) {
      return userData['userType'];
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: getUserType(),
      builder: (context, snapshot) {
        Widget wholesalerWidget = Container();
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData && snapshot.data == 'WHOLESALER') {
            wholesalerWidget = Card(
              elevation: 5.0,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      const Icon(
                        Icons.upload,
                        size: 30.0,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Upload Products',
                        style: GoogleFonts.montserrat(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),
                      )
                    ]),
                    IconButton(
                      onPressed: () => Navigator.pushNamed(context, UploadProductScreen.id),
                      icon: const Icon(Icons.navigate_next),
                    )
                  ],
                ),
              ),
            );
          }
        }
        return Column(
          children: [
            Card(
              elevation: 5.0,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      const Icon(
                        Icons.person_outline,
                        size: 30.0,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Profile',
                        style: GoogleFonts.montserrat(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),
                      )
                    ]),
                    IconButton(
                      onPressed: () => Navigator.pushNamed(context, EditProfileScreen.id),
                      icon: const Icon(Icons.navigate_next),
                    )
                  ],
                ),
              ),
            ),
            Card(
              elevation: 5.0,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      const Icon(
                        Icons.shop_2_outlined,
                        size: 30.0,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Order history',
                        style: GoogleFonts.montserrat(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),
                      )
                    ]),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.navigate_next),
                    )
                  ],
                ),
              ),
            ),
            Card(
              elevation: 5.0,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      const Icon(
                        Icons.track_changes,
                        size: 30.0,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Track Order',
                        style: GoogleFonts.montserrat(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),
                      )
                    ]),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.navigate_next),
                    )
                  ],
                ),
              ),
            ),
            Card(
              elevation: 5.0,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      const Icon(
                        Icons.payment,
                        size: 30.0,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Payment Methods',
                        style: GoogleFonts.montserrat(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),
                      )
                    ]),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.navigate_next),
                    )
                  ],
                ),
              ),
            ),
            Card(
              elevation: 5.0,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      const Icon(
                        Icons.settings,
                        size: 30.0,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Settings',
                        style: GoogleFonts.montserrat(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),
                      )
                    ]),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.navigate_next),
                    )
                  ],
                ),
              ),
            ),
            wholesalerWidget,
          ],
        );
      },
    );
  }
}
