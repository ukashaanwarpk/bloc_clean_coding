import 'dart:convert';

import 'package:bloc_clean_coding/model/user/user_model.dart';
import 'package:bloc_clean_coding/services/storage/local_storage.dart';
import 'package:flutter/foundation.dart';

class SessionController {
  final LocalStorage _localStorage = LocalStorage();

  static UserModel user = UserModel();

  static bool? isLogin;

  static final SessionController _singleton = SessionController._internal();

  SessionController._internal() {
    isLogin = false;
  }

  factory SessionController() => _singleton;

  Future<void> saveUserData(dynamic user) async {
    _localStorage.setValue('token', jsonEncode(user));
    _localStorage.setValue('isLogin', 'true');
  }

  Future<void> getUserData() async {
    try {
      String userData = await _localStorage.readValue('token');
      var isLogin = await _localStorage.readValue('isLogin');

      if (userData.isNotEmpty) {
        SessionController.user = UserModel.fromJson(jsonDecode(userData));
      }
      SessionController.isLogin = isLogin == 'true' ? true : false;
    } catch (e, stack) {
      debugPrint('The error in getUserData $e, $stack');
    }
  }
}
