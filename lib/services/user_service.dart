import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/user_model.dart';

class UserService {
  Future<UserModel?> registerUser({
    required String email,
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String password,
    required String userType,
  }) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8080/users/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'email': email,
        'firstName': firstName,
        'lastName': lastName,
        'phoneNumber': phoneNumber,
        'password': password,
        'userType': userType,
      }),
    );

    if (response.statusCode == 200) {
      print("Raw response body: ${response.body}");
      final data = json.decode(response.body);
      if (data['responseCode'] == '000') {
        return UserModel.fromJson(data);
      } else {
        print(data['responseMessage']);
        throw Exception(data['responseMessage']);
      }
    } else {
      print(response.body);
      throw Exception('Could not register');
    }
  }

  Future<UserModel?> loginUser({
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8080/users/login'),
      // Use the actual IP for localhost
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      print("Raw response body: ${response.body}");
      final data = json.decode(response.body);
      if (data['responseCode'] == '000') {
        return UserModel.fromJson(data);
      } else {
        print(data['responseMessage']);
        throw Exception(data['responseMessage']);
      }
    } else {
      print(response.body);
      throw Exception('Failed to sign in');
    }
  }
}
