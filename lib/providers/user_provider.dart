import 'package:flutter/material.dart';
import 'package:sac_app/model/card.dart';
import 'package:sac_app/resources/auth_method.dart';

import '../model/user.dart';

class UserProvider with ChangeNotifier {
  SportsCard? _card;
  final AuthMethods _authMethods = AuthMethods();

  SportsCard get getcard => _card!;

  Future<void> refreshUser() async {
    SportsCard card = (await _authMethods.getUserDetails()) as SportsCard;
    _card = card;
    notifyListeners();
  }
}
