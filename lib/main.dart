import 'package:connectmart/screens/upload_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'dashboard/dashboard.dart';
import 'onboarding_screens/onboarding_screen_one.dart';
import 'onboarding_screens/onboarding_screen_two.dart';
import 'onboarding_screens/splash_screen.dart';
import 'providers/product_provider.dart';
import 'providers/user_provider.dart';
import 'screens/card_screen.dart';
import 'screens/edit_profile_screen.dart';
import 'screens/search_screen.dart';
import 'signin_screens/account_creation_screen.dart';
import 'signin_screens/forgot_password_screen.dart';
import 'signin_screens/signin_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentDir.path);
  await Hive.openBox('userBox');
  await Hive.openBox('cartBox');
  await Hive.openBox('businessAddressDetails');
  await Hive.openBox('cardDetails');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xffEF374C)),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
        routes: {
          OnboardingScreenOne.id: (context) => OnboardingScreenOne(),
          OnboardingScreenTwo.id: (context) => OnboardingScreenTwo(),
          SigninScreen.id: (context) => const SigninScreen(),
          ForgotPasswordScreen.id: (context) => const ForgotPasswordScreen(),
          AccountCreation.id: (context) => const AccountCreation(),
          Dashboard.id: (context) => const Dashboard(),
          EditProfileScreen.id: (context) => const EditProfileScreen(),
          SearchScreen.id: (context) => SearchScreen(),
          CardScreen.id: (context) => const CardScreen(),
          UploadProductScreen.id: (context) => const UploadProductScreen(),
          SplashScreen.id: (context) {
            final userBox = Hive.box('userBox');
            if (userBox.containsKey('userId') &&
                userBox.containsKey('email') &&
                userBox.containsKey('firstName') &&
                userBox.containsKey('lastName')) {
              // User is logged in, navigate to Dashboard
              return const Dashboard();
            } else {
              // User is not logged in, navigate to OnboardingScreenOne
              return OnboardingScreenOne();
            }
          },
        },
      ),
    ),
  );
}
