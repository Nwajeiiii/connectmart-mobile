import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  static String id = '/forgot-password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Forgot Password'),
      ),
    );
  }
}
