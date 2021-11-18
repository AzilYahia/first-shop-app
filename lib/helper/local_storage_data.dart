import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_appp/model/user_model.dart';

class LocalStorageUser {
  static setUser(UserModel usermodel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('user', json.encode(usermodel.toJson()));
  }

  static Future<UserModel> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return UserModel.fromJson(
        json.decode(prefs.getString('user')!) as Map<dynamic, dynamic>);
  }

  static void deleteUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
