import 'dart:convert';
import 'dart:io';
import 'package:chattingapp/constants.dart';
import 'package:chattingapp/model/models.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  //request to login
  Future<AuthResponseModel> login(LoginRequestModel requestModel) async {
    //IMPLEMENT USER LOGIN
    try {
      final response = await http.post(
        Uri.parse('${baseurl}login'),
        body: requestModel.toJson(),
      );

      switch (response.statusCode) {
        case 200:
          final data = json.decode(response.body);
          return AuthResponseModel.fromJson(data);
        case 400:
          final data = json.decode(response.body);
          return AuthResponseModel.fromJson(data);

        default:
          throw Exception(response.body);
      }
    } on SocketException catch (_) {
      rethrow;
    }
  }

  //request to Register
  Future<AuthResponseModel> register(RegisterRequestModel requestModel) async {
    //IMPLEMENT USER LOGIN
    try {
      final response = await http.post(
        Uri.parse('${baseurl}register'),
        body: requestModel.toJson(),
      );

      switch (response.statusCode) {
        case 201:
          final data = json.decode(response.body);
          return AuthResponseModel.fromJson(data);
        case 400:
          final data = json.decode(response.body);
          return AuthResponseModel.fromJson(data);

        default:
          throw Exception(response.body);
      }
    } on SocketException catch (_) {
      rethrow;
    }
  }


  //verify OTP Pin from login
  Future<VerifyOTPResponseModel> verifyOP(
      VerifyOTPRequestModel requestModel) async {
    //IMPLEMENT Verify OTP Pin
    try {
      final response = await http.post(
        Uri.parse('${baseurl}verifyOTP'),
        body: requestModel.toJson(),
      );
      switch (response.statusCode) {
        case 200:
          final data = json.decode(response.body);
          return VerifyOTPResponseModel.fromJson(data);
        case 400:
          final data = json.decode(response.body);
          return VerifyOTPResponseModel.fromJson(data);
        case 404:
          final data = json.decode(response.body);
          return VerifyOTPResponseModel.fromJson(data);
        default:
          throw Exception(response.body);
      }
    } on SocketException catch (_) {
      rethrow;
    }
  }

  //request OTP Pin
  Future<AuthResponseModel> requestOTP(
      ReqOTPRequestModel requestModel) async {
    //IMPLEMENT Request OTP Pin
    try {
      final response = await http.post(Uri.parse('${baseurl}reqOTP'),
          body: requestModel.toJson());

      switch (response.statusCode) {
        case 200:
          final data = json.decode(response.body);
          return AuthResponseModel.fromJson(data);

        case 500:
          final data = json.decode(response.body);
          return AuthResponseModel.fromJson(data);

        default:
          throw Exception(response.body);
      }
    } on SocketException catch (_) {
      rethrow;
    }
  }


  //Send an email asking for password reset
  Future<AuthResponseModel> passwordReset(
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
          return AuthResponseModel.fromJson(data);
        case 400:
          final data = json.decode(response.body);
          return AuthResponseModel.fromJson(data);
        case 404:
          final data = json.decode(response.body);
          return AuthResponseModel.fromJson(data);
        default:
          throw Exception(response.body);
      }
    } on SocketException catch (_) {
      rethrow;
    }
  }

  //Verify reset user account
  Future<AuthResponseModel> verifyAccount(
      VerifyOTPRequestModel requestModel) async {
    //IMPLEMENT Verify FORGOTPASSWORD request OTP PIN
    try {
      final response = await http.post(
        Uri.parse('${baseurl}verifyresetpass'),
        body: requestModel.toJson(),
      );

      switch (response.statusCode) {
        case 200:
          final data = json.decode(response.body);
          return AuthResponseModel.fromJson(data);
        case 400:
          final data = json.decode(response.body);
          return AuthResponseModel.fromJson(data);
        case 404:
          final data = json.decode(response.body);
          return AuthResponseModel.fromJson(data);
        default:
          throw Exception(response.body);
      }
    } on SocketException catch (_) {
      rethrow;
    }
  }

  //Create new passwords
  Future<VerifyOTPResponseModel> newPassword(
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
          return VerifyOTPResponseModel.fromJson(data);
        case 400:
          final data = json.decode(response.body);
          return VerifyOTPResponseModel.fromJson(data);
        default:
          throw Exception(response.body);
      }
    } on SocketException catch (_) {
      rethrow;
    }
  }
}
