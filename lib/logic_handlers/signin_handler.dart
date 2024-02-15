import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../dashboard/dashboard.dart';
import '../providers/user_provider.dart';
import '../services/user_service.dart';

class SignInHandler {
  final BuildContext context;

  SignInHandler(this.context);

  void signIn({
    required String email,
    required String password,
  }) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) =>
          const Center(child: CircularProgressIndicator()),
    );

    try {
      final user =
          await UserService().loginUser(email: email, password: password);
      if (user != null) {
        Provider.of<UserProvider>(context, listen: false).setUser(user);
        Navigator.pop(context); // Close the progress dialog
        Navigator.pushNamedAndRemoveUntil(
          context,
          Dashboard.id,
              (Route<dynamic> route) => false,
        );
        // Navigate to dashboard
      }
    } catch (e) {
      Navigator.pop(context); // Close the progress dialog
      _showErrorDialog(context, e.toString());
    }
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Sign In Failed'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
