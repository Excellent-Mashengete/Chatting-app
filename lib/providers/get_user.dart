import 'package:flutter/material.dart';
import 'package:chattingapp/model/models.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

//deals with logged in users
class GetUser extends ChangeNotifier {
  //add user data to hive
  addItem(User users) async {
    await Hive.initFlutter();
    var box = await Hive.openBox('user_profile');
    if (box.isNotEmpty || box.isEmpty) {
      box.clear();
      box.add(users);
    }
    notifyListeners();
  }

  List _userList = <User>[];
  List get userList => _userList;

  //get user data from hive
  Future<void> getUserProfile() async {
    final box = await Hive.openBox('user_profile');
    _userList = box.values.toList();
    notifyListeners();
  }

  String _token = '';
  get token => _token;

  //get user token from hive
  Future<void> getToken() async {
    final box = await Hive.openBox('user_profile');
    _token = box.values.first.token;
    notifyListeners();
  }

  String _profilepic = "";
  get profilepic => _profilepic;

  //get user profile picture from hive
  Future<void> getProfile() async {
    final box = await Hive.openBox('user_profile');
    _profilepic = box.values.first.avatar;
    notifyListeners();
  }

  // Update user profile picture
  updateItem(int index, User users) {
    final box = Hive.box<User>('user');
    box.putAt(index, users);
    notifyListeners();
  }

  //Logging user out
  deleteItem(int index) {
    final box = Hive.box<User>('user');
    box.deleteAt(index);
    notifyListeners();
  }
}
