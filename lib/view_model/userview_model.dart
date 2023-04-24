import 'package:flutter/cupertino.dart';
import 'package:mvvm_structure/model/user_model.dart';

import 'package:shared_preferences/shared_preferences.dart';

class UserviewModel with ChangeNotifier {

  // Save the User
  Future<bool> saveUser(user_model user) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', user.token.toString());
    notifyListeners();
    return true;
  }

  // Get the User
  Future<user_model> getUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('token');

    return user_model(token: token.toString());
  }

  // Remove the User
  Future<bool> remove() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('token');
    return true;
  }
}
