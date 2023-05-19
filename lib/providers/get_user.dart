import 'package:chattingapp/model/user_token.dart';
import 'package:flutter/material.dart';
import 'package:chattingapp/model/models.dart';
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


  addToken(Token token) async {
    await Hive.initFlutter();
    var box = await Hive.openBox('token');
    if (box.isNotEmpty || box.isEmpty) {
      box.clear();
      box.add(token);
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
    final box = await Hive.openBox('token');
    _token = box.get(0);
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
  logout(User index) async {
    index.delete();
    notifyListeners();
  }
}
