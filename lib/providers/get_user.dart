import 'package:flutter/material.dart';
import 'package:chattingapp/model/models.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';

//deals with logged in users
class GetUser extends ChangeNotifier {
  static const secureStorage = FlutterSecureStorage();

  addUser(CurrentUser user) async {
    //checks if key exists if not generate a new key
    final encryptionKey = await secureStorage.read(key: 'encryptedUser');
    if (encryptionKey == null) {
      final key = Hive.generateSecureKey();
      await secureStorage.write(
          key: 'encryptedUser', value: base64UrlEncode(key));
    }

    final newKey = await secureStorage.read(
        key: 'encryptedUser'); // read the newly generated key
    final encryptionKeyUint8List = base64Url.decode(newKey!);

    //open an encrypted box
    final encryptedBox = await Hive.openBox('user',
        encryptionCipher: HiveAesCipher(encryptionKeyUint8List));

    if (encryptedBox.isEmpty) {
      encryptedBox.clear();
      encryptedBox.add(user); //save the user in an encrypted box
    }

    notifyListeners();
  }

  addToken(Token token) async {
    //checks if key exists if not generate a new key
    final encryptionKey = await secureStorage.read(key: 'encryptedUserToken');
    if (encryptionKey == null) {
      final key = Hive.generateSecureKey();
      await secureStorage.write(
          key: 'encryptedUserToken', value: base64UrlEncode(key));
    }

    final newKey = await secureStorage.read(
        key: 'encryptedUserToken'); // read the newly generated key
    final encryptionKeyUint8List = base64Url.decode(newKey!);

    //open an encrypted box
    final encryptedBox = await Hive.openBox('token',
        encryptionCipher: HiveAesCipher(encryptionKeyUint8List));

    if (encryptedBox.isEmpty) {
      encryptedBox.clear();
      encryptedBox.add(token);
    }

    notifyListeners();
  }

  addUserID(UserId id) async {
    //checks if key exists if not generate a new key
    final encryptionKey = await secureStorage.read(key: 'encryptedUserUid');
    if (encryptionKey == null) {
      final key = Hive.generateSecureKey();
      await secureStorage.write(
          key: 'encryptedUserUid', value: base64UrlEncode(key));
    }

    final newKey = await secureStorage.read(
        key: 'encryptedUserUid'); // read the newly generated key
    final encryptionKeyUint8List = base64Url.decode(newKey!);

    //open an encrypted box
    final encryptedBox = await Hive.openBox('useruid',
        encryptionCipher: HiveAesCipher(encryptionKeyUint8List));

    if (encryptedBox.isEmpty) {
      encryptedBox.clear();
      encryptedBox.add(id);
    }

    notifyListeners();
  }

  //get user biometroc status from hive
  addBiometrics(bool fingerPrint) async {
    print(fingerPrint);
    var box = await Hive.openBox('biometrics');
    box.put('fingerprint', fingerPrint);
    notifyListeners();
  }

  bool _biometric = false;
  get biometric => _biometric;

  //get user biometroc status from hive
  Future<void> getBiometric() async {
    final box = await Hive.openBox('biometrics');
    _biometric = box.get('fingerprint');
    notifyListeners();
  }

  List _userList = [];
  List get userList => _userList;

  //get user data from hive
  Future<void> getUserProfile() async {
    final encryptedBox = await Hive.openBox('user');
    _userList = encryptedBox.values.toList();
    notifyListeners();
  }

  String _profilepic = "";
  get profilepic => _profilepic;

  //get user profile picture from hive
  Future<void> getProfile() async {
    final encryptedBox = await Hive.openBox('user');
    _profilepic = encryptedBox.values.first.avatar;
    notifyListeners();
  }

  //Logging user out
  logout() async {
    var box = await Hive.openBox('user_profile');
    var box1 = await Hive.openBox('token');
    box.clear();
    box1.clear();
    box.close();
    box1.close();
    notifyListeners();
  }
}
