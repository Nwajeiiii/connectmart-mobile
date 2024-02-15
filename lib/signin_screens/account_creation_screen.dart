import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/screen_margins.dart';
import 'signup_screen.dart';

class AccountCreation extends StatefulWidget {
  const AccountCreation({super.key});

  static String id = '/account-creation';

  @override
  State<AccountCreation> createState() => _AccountCreationState();
}

class _AccountCreationState extends State<AccountCreation> {
  bool _isNextVisible = false; // To control visibility of the Next button.
  String _selectedAccountType = ''; // To store the user's selection.

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: kMainPageMargin,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: Container()),
                  Visibility(
                    // Wrap with Visibility widget.
                    visible: _isNextVisible,
                    child: InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SignupScreen(userType: _selectedAccountType),
                        ),
                      ),
                      child: BounceInDown(
                        key: _basicAnimation1,
                        child: Text(
                          'Next',
                          style: GoogleFonts.montserrat(
                            color: const Color(0xffEF374C),
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              RotateInDownLeft(
                key: _basicAnimation2,
                child: Text(
                  'What type of account will you like to create',
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              LightSpeedIn(
                key: _basicAnimation3,
                child: Image.asset('assets/images/png/wholesaler.png'),
              ),
              const SizedBox(
                height: 10.0,
              ),
              LightSpeedIn(
                key: _basicAnimation4,
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        _selectedAccountType == 'Wholesaler'
                            ? const Color(0xffEF374C)
                            : Colors.white),
                    foregroundColor: MaterialStatePropertyAll(
                        _selectedAccountType == 'Wholesaler'
                            ? Colors.white
                            : const Color(0xffEF374C)),
                    minimumSize: const MaterialStatePropertyAll(
                        Size(double.infinity, 50)),
                    shape: const MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                    side: const MaterialStatePropertyAll(
                        BorderSide(color: Color(0xffEF374C))),
                  ),
                  onPressed: () {
                    setState(() {
                      _selectedAccountType = 'Wholesaler';
                      _isNextVisible = true; // Make Next button visible.
                      print(_selectedAccountType);
                    });
                  },
                  child: const Text('Wholesaler'),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              RotateInUpRight(
                key: _basicAnimation5,
                child: Image.asset('assets/images/png/retailer.png'),
              ),
              const SizedBox(
                height: 10.0,
              ),
              LightSpeedIn(
                key: _basicAnimation6,
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        _selectedAccountType == 'Retailer'
                            ? const Color(0xffEF374C)
                            : Colors.white),
                    foregroundColor: MaterialStatePropertyAll(
                        _selectedAccountType == 'Retailer'
                            ? Colors.white
                            : const Color(0xffEF374C)),
                    minimumSize: const MaterialStatePropertyAll(
                        Size(double.infinity, 50)),
                    shape: const MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                    side: const MaterialStatePropertyAll(
                        BorderSide(color: Color(0xffEF374C))),
                  ),
                  onPressed: () {
                    setState(() {
                      _selectedAccountType = 'Retailer';
                      _isNextVisible = true; // Make Next button visible.
                      print(_selectedAccountType);
                    });
                  },
                  child: const Text('Retailer'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
