import 'dart:convert';
import 'dart:io';
import 'package:chattingapp/constants.dart';
import 'package:chattingapp/model/models.dart';
import 'package:chattingapp/service/hive.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    //IMPLEMENT USER LOGIN
    try {
      final response = await http.post(
        Uri.parse('${baseurl}login'),
        body: requestModel.toJson(),
      );

      switch (response.statusCode) {
        case 200:
          final data = json.decode(response.body);
          return LoginResponseModel.fromJson(data);
        case 400:
          final data = json.decode(response.body);
          return LoginResponseModel.fromJson(data);

        default:
          throw Exception(response.body);
      }
    } on SocketException catch (_) {
      rethrow;
    }
  }

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
          StoreUserData.fromJson(data);
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

  Future<ReqOTPResponseModel> requestOTP(
      ReqOTPRequestModel requestModel) async {
    //IMPLEMENT Request OTP Pin
    try {
      final response = await http.post(Uri.parse('${baseurl}reqOTP'),
          body: requestModel.toJson());

      switch (response.statusCode) {
        case 200:
          final data = json.decode(response.body);
          return ReqOTPResponseModel.fromJson(data);

        case 500:
          final data = json.decode(response.body);
          return ReqOTPResponseModel.fromJson(data);

        default:
          throw Exception(response.body);
      }
    } on SocketException catch (_) {
      rethrow;
    }
  }
}
