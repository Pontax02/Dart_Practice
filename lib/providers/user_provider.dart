import 'package:flutter/material.dart';
import 'package:flutter_application_test/models/user.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(email: '', username: '', uid: '');

  User get user => _user;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }
}
