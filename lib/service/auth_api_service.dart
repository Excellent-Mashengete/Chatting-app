import 'package:chattingapp/Authentication/authentication.dart';
import 'package:chattingapp/Authentication/mobile.dart';
import 'package:chattingapp/common/common.dart';
import 'package:chattingapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ApiClient {
  final Authentication _authentication = Authentication();
  final MobileAuth _mobileotp = MobileAuth();

  //Login with google
  Future<void> logInWithGoogle(context) async {
    try {
      await _authentication.signInWithGoogle();
    } on LogInWithGoogleFailure catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    } catch (_) {
      rethrow;
    }
  }

  Future<void> logInWithEmailAndPassword(context, email, password) async {
    try {
      await _authentication.signInWithEmailAndPassword(
          email: email, password: password);

      await _mobileotp.sendOTP(email, context);

      Navigator.pushNamed(context, verifyOtp, arguments: email);
    } on LogInWithGoogleFailure catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    } catch (_) {
      rethrow;
    }
  }

  Future<void> registerNewUser(
      context, String email, String password, String name) async {
    try {
      await _authentication.createNewUser(
        email: email,
        password: password,
        name: name,
      );

      await _mobileotp.sendOTP(email, context);
      Navigator.pushNamed(context, verifyOtp, arguments: email);
    } on LogInWithGoogleFailure catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    } catch (_) {
      rethrow;
    }
  }

  Future resendOtp(context, String email) async {
    try {
      await _mobileotp.sendOTP(email, context);
    } catch (_) {
      rethrow;
    }
  }

  Future verifyOTP(context, String email, code1, code2, code3, code4) async {
    final otp = code1 + code2 + code3 + code4;
    try {
      await _mobileotp.verifyOTP(email, otp, context);
      
    } catch (_) {
      rethrow;
    }
  }

  Future<void> logOutUser(context) async {
    final box = await Hive.openBox('user');
    final box1 = await Hive.openBox('token');
    final box2 = await Hive.openBox('useruid');
    await box.clear();
    await box1.clear();
    await box2.clear();
    await _authentication.logOut();
  }
}
