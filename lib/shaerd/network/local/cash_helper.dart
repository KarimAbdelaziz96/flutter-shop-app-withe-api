// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:shared_preferences/shared_preferences.dart';

class cashHelper {
  static SharedPreferences? sharedPreferences;

  static Init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> putdata({
    required String Key,
    required bool Value,
  }) async {
    return await sharedPreferences!.setBool(Key, Value);
  }

  static dynamic getdata({
    required String Key,
  }) {
    return sharedPreferences?.get(Key);
  }

  static Future<bool?> SaveData({
    required String Key,
    required dynamic Value,
  }) async {
    if (Value is String) {
      return await sharedPreferences?.setString(Key, Value) ;
    }
    if (Value is int) {
      return await sharedPreferences?.setInt(Key, Value) ;
    }
    if (Value is bool) {
      return await sharedPreferences?.setBool(Key, Value);
    }
    return await sharedPreferences?.setDouble(Key, Value);
  }

  static Future<bool> Removedata({
    required String Key,
  }) async {
    return await sharedPreferences!.remove(Key);
  }

  static getData({required String key}) {}
}
