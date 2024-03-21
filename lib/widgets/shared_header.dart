import 'package:connectmart/logic_handlers/search_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:google_fonts/google_fonts.dart';

// Shared Header and Search Widget
class SharedHeader extends StatelessWidget {
  final GlobalKey<AnimatorWidgetState> basicAnimation1;
  final GlobalKey<AnimatorWidgetState> basicAnimation2;
  final GlobalKey<AnimatorWidgetState> basicAnimation3;
  final GlobalKey<AnimatorWidgetState> basicAnimation4;
  final TextEditingController searchController;
  final Function onMenuPressed;

  const SharedHeader({
    Key? key,
    required this.basicAnimation1,
    required this.basicAnimation2,
    required this.basicAnimation3,
    required this.basicAnimation4,
    required this.searchController,
    required this.onMenuPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: BounceInDown(
                key: basicAnimation1,
                child: const Icon(Icons.menu, color: Colors.black),
              ),
              onPressed: () => onMenuPressed(),
            ),
            BounceInDown(
              key: basicAnimation2,
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
                backgroundColor: MaterialStatePropertyAll(Color(0xfff9afb7)),
              ),
              onPressed: () {},
              icon: BounceInDown(
                key: basicAnimation3,
                child: const Icon(Icons.notifications, color: Colors.white),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20.0),
        BounceInDown(
          key: basicAnimation4,
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
              hintText:
                  'Search for clothes, watches, bags, phones and whatever you want !',
              enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color(0xfff6d1d5), width: 1.0),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color(0xfff6d1d5), width: 2.0),
                borderRadius: BorderRadius.circular(10),
              ),
              prefixIcon: IconButton(
                onPressed: () => SearchHandler.executeSearch(context, searchController.text),
                icon: const Icon(Icons.search_sharp, color: Color(0xfff6d1d5)),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10.0),
      ],
    );
  }
}
