import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/screen_margins.dart';
import '../constants/text_styles.dart';
import '../signin_screens/signin_screen.dart';

class OnboardingScreenTwo extends StatelessWidget {
  OnboardingScreenTwo({super.key});

  static String id = '/onboarding-two';

  final GlobalKey<AnimatorWidgetState> basicAnimation1 =
  GlobalKey<AnimatorWidgetState>();
  final GlobalKey<AnimatorWidgetState> basicAnimation2 =
  GlobalKey<AnimatorWidgetState>();
  final GlobalKey<AnimatorWidgetState> basicAnimation3 =
  GlobalKey<AnimatorWidgetState>();
  final GlobalKey<AnimatorWidgetState> basicAnimation4 =
  GlobalKey<AnimatorWidgetState>();
  final GlobalKey<AnimatorWidgetState> basicAnimation5 =
  GlobalKey<AnimatorWidgetState>();
  final GlobalKey<AnimatorWidgetState> basicAnimation6 =
  GlobalKey<AnimatorWidgetState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: kMainPageMargin,
          child: Column(
            children: [
              BounceIn(
                key: basicAnimation1,
                child:
                Image.asset('assets/images/png/connectmart-logo-small.png'),
              ),
              const SizedBox(
                height: 40
              ),
              BounceIn(
                key: basicAnimation2,
                child: Image.asset('assets/images/png/Onboarding Image 1.png'),
              ),
              const SizedBox(
                height: 50
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: BounceInDown(
                  key: basicAnimation3,
                  child: Text(
                    'Track Orders Easily',
                    textAlign: TextAlign.center,
                    style: kBoldLargeBlackFontStyle,
                  ),
                ),
              ),
              const SizedBox(
                height: 15
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: BounceInDown(
                  key: basicAnimation4,
                  child: Text(
                    'Manage bulk orders easily and track them in real-time, with reliable reviews for each transaction',
                    textAlign: TextAlign.center,
                    style: kW400SmallGreyFontStyle,
                  ),
                ),
              ),
              Expanded(child: Container()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, SigninScreen.id);
                    },
                    child: BounceInRight(
                      key: basicAnimation5,
                      child: Text(
                        'Skip',
                        style: GoogleFonts.montserrat(
                          color: const Color(0xffEF374C),
                        ),
                      ),
                    ),
                  ),
                  BounceInLeft(
                    key: basicAnimation6,
                    child: IconButton(
                      style: const ButtonStyle(
                        backgroundColor:
                        MaterialStatePropertyAll(Color(0xffEF374C)),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, SigninScreen.id);
                      },
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
