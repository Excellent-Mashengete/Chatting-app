import 'dart:convert';
import 'dart:io';
import 'package:chattingapp/constants.dart';
import 'package:chattingapp/model/models.dart';
import 'package:http/http.dart' as http;

class RestApiClient {
  //Send an email asking for password reset
  Future<ResetPassResponseModel> passwordReset(
      ResetPassRequestModel requestModel) async {
    //IMPLEMENT REQUEST FORGOTPASSWORD OTP PIN
    try {
      final response = await http.post(
        Uri.parse('${baseurl}resetPassword'),
        body: requestModel.toJson(),
      );

      switch (response.statusCode) {
        case 200:
          final data = json.decode(response.body);
          return ResetPassResponseModel.fromJson(data);
        case 400:
          final data = json.decode(response.body);
          return ResetPassResponseModel.fromJson(data);
        case 404:
          final data = json.decode(response.body);
          return ResetPassResponseModel.fromJson(data);
        default:
          throw Exception(response.body);
      }
    } on SocketException catch (_) {
      rethrow;
    }
  }

  //Verify reset user account
  Future<ForgotVerifyResponseModel> verifyAccount(
      ForgotVerifyOTPRequestModel requestModel) async {
    //IMPLEMENT Verify FORGOTPASSWORD request OTP PIN
    try {
      final response = await http.post(
        Uri.parse('${baseurl}verifyresetpass'),
        body: requestModel.toJson(),
      );

      switch (response.statusCode) {
        case 200:
          final data = json.decode(response.body);
          return ForgotVerifyResponseModel.fromJson(data);
        case 400:
          final data = json.decode(response.body);
          return ForgotVerifyResponseModel.fromJson(data);
        case 404:
          final data = json.decode(response.body);
          return ForgotVerifyResponseModel.fromJson(data);
        default:
          throw Exception(response.body);
      }
    } on SocketException catch (_) {
      rethrow;
    }
  }

  //Create new passwords
  Future<ForgotNewPassResponseModel> newPassword(
      ForgotNewPassRequestModel requestModel) async {
    //IMPLEMENT REQUEST FORGOTPASSWORD OTP PIN
    try {
      final response = await http.post(
        Uri.parse('${baseurl}newpassword'),
        body: requestModel.toJson(),
      );

      switch (response.statusCode) {
        case 200:
          final data = json.decode(response.body);
          return ForgotNewPassResponseModel.fromJson(data);
        case 400:
          final data = json.decode(response.body);
          return ForgotNewPassResponseModel.fromJson(data);
        default:
          throw Exception(response.body);
      }
    } on SocketException catch (_) {
      rethrow;
    }
  }
}
