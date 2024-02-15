import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'onboarding_screen_one.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static String id = '/splash';

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: Colors.white,
      nextScreen: OnboardingScreenOne(),
      splash: 'assets/images/png/connectmart-logo.png',
    );
  }
}
