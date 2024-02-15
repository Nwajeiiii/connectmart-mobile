import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../models/user_model.dart';

class UserProvider with ChangeNotifier {
  UserModel? _user;

  UserModel? get user => _user;

  void setUser(UserModel user) {
    _user = user;
    notifyListeners();
    saveUserToLocal(user);
  }

  Future<void> saveUserToLocal(UserModel user) async {
    var box = await Hive.openBox('userBox');
    await box.put('user', user.toJson());
    printStoredUserModel();
  }

  Future<UserModel?> getUserFromLocal() async {
    var box = await Hive.openBox('userBox');
    final userData = box.get('user');
    if (userData != null) {
      return UserModel.fromJson(userData);
    }
    return null;
  }


  Future<void> printStoredUserModel() async {
    var box = await Hive.openBox('userBox');
    var storedUserMap = box.get('user');

    if (storedUserMap != null) {
      UserModel storedUser = UserModel.fromJson(storedUserMap);
      print('Stored User: ${storedUser.toJson()}');
    } else {
      print('No user data stored in Hive.');
    }
  }

}
