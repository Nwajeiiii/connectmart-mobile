import 'package:flutter/material.dart';

InputDecoration kCustomInputDecoration({required String hintText}) {
  return InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Color(0xffdbdbdb)),
    ),
    filled: true,
    // Needed for fillColor to take effect
    fillColor: const Color(0xfff5f5f5),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Color(0xffdbdbdb)),
    ),
    hintText: hintText,
  );
}

InputDecoration kCustomPersonalDetailsUnmodifiableDecoration() {
  return InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Color(0xffdbdbdb)),
    ),
    filled: true,
    // Needed for fillColor to take effect
    fillColor: const Color(0xfff5f5f5),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Color(0xffdbdbdb)),
    ),
  );
}

InputDecoration kCustomPasswordInputDecoration({
  required String hintText,
  required bool isPasswordVisible,
  required VoidCallback togglePasswordVisibility,
}) {
  return InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Color(0xffdbdbdb)),
    ),
    filled: true,
    fillColor: const Color(0xfff5f5f5),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Color(0xffdbdbdb)),
    ),
    hintText: hintText,
    suffixIcon: IconButton(
      icon: Icon(
        isPasswordVisible ? Icons.visibility_off : Icons.visibility,
        color: Colors.grey,
      ),
      onPressed: () {
        // Toggle password visibility
        togglePasswordVisibility();
      },
    ),
  );
}


