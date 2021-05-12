import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:project_x/app/data/dummy_users.dart';
import 'package:project_x/app/models/user_model.dart';

class Users with ChangeNotifier {
  final Map<String, User> _items = {...DUMMY_USERS};

  List<User> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  User byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(User user) {
    if (user == null) {
      return;
    }
    if (user.id.isNotEmpty && //atualizar
        user.id.trim().isNotEmpty &&
        _items.containsKey(user.id)) {
      _items.update(
          user.id,
          (_) => User(
                id: user.id,
                name: user.name,
                email: user.email,
                avatarUrl: user.avatarUrl,
              ));
    } else {
      //adicionar
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
          id,
          () => User(
                id: id,
                name: user.name,
                email: user.email,
                avatarUrl: user.avatarUrl,
              ));
    }

    notifyListeners();
  }

  void remove(User user) {
    if (user != null && user.id.isNotEmpty) {
      _items.remove(user.id);
    }
    notifyListeners();
  }
}
