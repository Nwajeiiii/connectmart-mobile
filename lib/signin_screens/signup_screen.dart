import 'package:connectmart/logic_handlers/signup_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';

import '../constants/screen_margins.dart';
import '../constants/text_styles.dart';
import '../widgets/custom_button_styles.dart';
import '../widgets/custom_input_decoration.dart';
import 'signin_screen.dart';

class SignupScreen extends StatefulWidget {
  final String userType;

  const SignupScreen({Key? key, required this.userType})
      : super(key: key); // Modify the constructor to accept userType

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isPasswordVisible = false;

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
  final GlobalKey<AnimatorWidgetState> _basicAnimation9 =
      GlobalKey<AnimatorWidgetState>();
  final GlobalKey<AnimatorWidgetState> _basicAnimation10 =
      GlobalKey<AnimatorWidgetState>();
  final GlobalKey<AnimatorWidgetState> _basicAnimation11 =
      GlobalKey<AnimatorWidgetState>();
  final GlobalKey<AnimatorWidgetState> _basicAnimation12 =
      GlobalKey<AnimatorWidgetState>();
  final GlobalKey<AnimatorWidgetState> _basicAnimation13 =
      GlobalKey<AnimatorWidgetState>();
  final GlobalKey<AnimatorWidgetState> _basicAnimation14 =
      GlobalKey<AnimatorWidgetState>();
  final GlobalKey<AnimatorWidgetState> _basicAnimation15 =
      GlobalKey<AnimatorWidgetState>();
  final GlobalKey<AnimatorWidgetState> _basicAnimation16 =
      GlobalKey<AnimatorWidgetState>();
  final GlobalKey<AnimatorWidgetState> _basicAnimation17 =
      GlobalKey<AnimatorWidgetState>();

  togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: kMainPageMargin,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: BounceInDown(
                    key: _basicAnimation1,
                    child: Image.asset('assets/images/png/Sign In Image.png'),
                  ),
                ),
                const SizedBox(height: 20.0),
                ZoomInLeft(
                  key: _basicAnimation2,
                  child: Text(
                    'Create An Account',
                    style: kBoldLargeBlackFontStyle,
                  ),
                ),
                ZoomInLeft(
                  key: _basicAnimation3,
                  child: Text(
                    'New here, sign up for a new account',
                    style: kW400SmallGreyFontStyle,
                  ),
                ),
                const SizedBox(height: 30.0),
                ZoomInLeft(
                  key: _basicAnimation14,
                  child: Text(
                    'First Name',
                    style: kBoldBigBlackFontStyle,
                  ),
                ),
                const SizedBox(height: 5.0),
                ZoomInLeft(
                  key: _basicAnimation15,
                  child: TextField(
                    controller: _firstNameController,
                    decoration: kCustomInputDecoration(
                      hintText: 'Input your first name',
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                ZoomInLeft(
                  key: _basicAnimation16,
                  child: Text(
                    'Last Name',
                    style: kBoldBigBlackFontStyle,
                  ),
                ),
                const SizedBox(height: 5.0),
                ZoomInLeft(
                  key: _basicAnimation17,
                  child: TextField(
                    controller: _lastNameController,
                    decoration: kCustomInputDecoration(
                      hintText: 'Input your last name',
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                ZoomInLeft(
                  key: _basicAnimation4,
                  child: Text(
                    'Email',
                    style: kBoldBigBlackFontStyle,
                  ),
                ),
                const SizedBox(height: 5.0),
                ZoomInLeft(
                  key: _basicAnimation5,
                  child: TextField(
                    controller: _emailController,
                    decoration: kCustomInputDecoration(
                      hintText: 'Input your email address',
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                ZoomInLeft(
                  key: _basicAnimation12,
                  child: Text(
                    'Phone Number',
                    style: kBoldBigBlackFontStyle,
                  ),
                ),
                const SizedBox(height: 5.0),
                ZoomInLeft(
                  key: _basicAnimation13,
                  child: TextField(
                    controller: _phoneNumberController,
                    decoration: kCustomInputDecoration(
                      hintText: 'Input your phone number',
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                ZoomInLeft(
                  key: _basicAnimation6,
                  child: Text('Password', style: kBoldBigBlackFontStyle),
                ),
                const SizedBox(height: 5.0),
                ZoomInLeft(
                  key: _basicAnimation7,
                  child: TextField(
                    controller: _passwordController,
                    obscureText: !_isPasswordVisible,
                    decoration: kCustomPasswordInputDecoration(
                      hintText: 'Input you password',
                      isPasswordVisible: _isPasswordVisible,
                      togglePasswordVisibility: togglePasswordVisibility,
                    ),
                  ),
                ),
                const SizedBox(height: 30.0),
                ZoomInLeft(
                  key: _basicAnimation9,
                  child: TextButton(
                    style: kAuthenticationButtonStyle,
                    onPressed: () => SignUpHandler(context).signUp(
                      email: _emailController.text,
                      firstName: _firstNameController.text,
                      lastName: _lastNameController.text,
                      phoneNumber: _phoneNumberController.text,
                      password: _passwordController.text,
                      userType: widget.userType.toUpperCase(),
                    ),
                    child: Text(
                      'Sign Up',
                      style: kAuthenticationButtonTextStyle,
                    ),
                  ),
                ),
                const SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BounceInDown(
                      key: _basicAnimation10,
                      child: Text(
                        'Already have an account? ',
                        style: kW600SmallBlackTextStyle,
                      ),
                    ),
                    InkWell(
                      onTap: () =>
                          Navigator.pushNamed(context, SigninScreen.id),
                      child: BounceInDown(
                        key: _basicAnimation11,
                        child: Text(
                          'Sign In',
                          style: kAuthenticationTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
