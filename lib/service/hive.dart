import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class StoreUserData {
  String? phone;
  String? name;
  String? token;

  StoreUserData({this.phone, this.name, this.token});

  StoreUserData.fromJson(Map<String, dynamic> json) {
    late Box box1;

    Future<void> saveUserDatat() async {
      box1 = await Hive.openBox('user');
      box1.put('user_name', json["name"]);
      box1.put('user_phone', json["phone"]);
      box1.put('user_token', json["token"]);
      box1.put('logintype', json["isLoogedIn"]);
    }
  }
}
