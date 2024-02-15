import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../dashboard/dashboard.dart';
import '../models/user_model.dart';
import '../providers/user_provider.dart';
import '../services/user_service.dart';

class SignUpHandler {
  final BuildContext context;
  SignUpHandler(this.context);

  void signUp({
    required String email,
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String password,
    required String userType,
  }) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Center(child: CircularProgressIndicator());
      },
    );

    try {
      final user = await UserService().registerUser(
        email: email,
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phoneNumber,
        password: password,
        userType: userType,
      );
      if (user != null) {
        // Create a complete UserModel including all fields
        final completeUserModel = UserModel(
          email: email,
          firstName: firstName,
          lastName: lastName,
          phoneNumber: phoneNumber,
          userType: userType,
          userId: user.userId, // Use the userId from the API response
        );

        // Save the complete user model instead of the partially returned one
        Provider.of<UserProvider>(context, listen: false).setUser(completeUserModel);
        Navigator.pop(context); // Remove the CircularProgressIndicator
        Navigator.pushNamedAndRemoveUntil(
          context,
          Dashboard.id,
              (Route<dynamic> route) => false,
        );

      }

    } catch (e) {
      Navigator.pop(context); // Remove the CircularProgressIndicator
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Registration Failed'),
            content: Text(e.toString()),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
}
