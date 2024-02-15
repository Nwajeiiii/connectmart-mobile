import 'package:flutter/material.dart';

const kAuthenticationButtonStyle = ButtonStyle(
  backgroundColor: MaterialStatePropertyAll(
    Color(
      0xffEF374C,
    ),
  ),
  foregroundColor: MaterialStatePropertyAll(
    Colors.white,
  ),
  minimumSize: MaterialStatePropertyAll(
    Size(
      double.infinity,
      50,
    ),
  ),
  shape: MaterialStatePropertyAll(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(
          10,
        ),
      ),
    ),
  ),
);