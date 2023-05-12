import 'package:hive_flutter/hive_flutter.dart';

class HandleHive {
  Future<void> storeData(String name, String phone, String token) async {
    await Hive.initFlutter();
    var box1 = await Hive.openBox('user');
    box1.put('user_name', name);
    box1.put('user_phone', phone);
    box1.put('user_token', token);
    box1.put('logintype', true);
  }

  Future<String> getToken() async {
    await Hive.initFlutter();
    var box1 = await Hive.openBox('user');
    return box1.get('user_token');
  }

  Future<String> getName() async {
    await Hive.initFlutter();
    var box1 = await Hive.openBox('user');
    return box1.get('user_name');
  }

  Future<void> removeAllData() async {
    await Hive.initFlutter();
    var box1 = await Hive.openBox('user');
    box1.put('logintype', false);
    box1.delete('user_name');
    box1.delete('user_phone');
    box1.delete('user_token');
  }
}
