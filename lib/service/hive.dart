import 'dart:ffi';
import 'package:hive_flutter/hive_flutter.dart';

class StoreUserData {
  String? phone;
  String? name;
  String? token;

  StoreUserData({this.phone, this.name, this.token});

  StoreUserData.fromJson(Map<String, dynamic> json) {
    late Box box1;

    Future<void> saveUserDatat() async {
      await Hive.initFlutter();
      box1 = await Hive.openBox('user');
      box1.put('user_name', json["name"]);
      box1.put('user_phone', json["phone"]);
      box1.put('user_token', json["token"]);
      box1.put('logintype', json["isLoogedIn"]);
    }
  }
}

Future<String> getToken() async {
  var box1 = await Hive.openBox('user');
  return box1.get('user_token');
}

Future<String> getName() async {
  var box1 = await Hive.openBox('user');
  return box1.get('user_name');
}

Future<Bool> getLogginType() async {
  var box1 = await Hive.openBox('user');
  return box1.get('logintype');
}
