import 'package:flutter/material.dart';
import 'package:project_x/app/data/dummy_login%20.dart';
import 'package:project_x/app/models/login_model.dart';

class LoginController with ChangeNotifier {
  final Map<String, Login> _items = {...DUMMY_LOGIN};

  bool verifyLogin(String email, String password) {
    for (int i = 0; i < _items.length; i++) {
      if (_items.values.elementAt(i).user.email == email &&
          _items.values.elementAt(i).password == password) {
        return true;
      }
    }

    return false;
  }
}
