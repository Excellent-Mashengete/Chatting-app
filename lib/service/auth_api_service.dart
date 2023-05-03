import 'dart:convert';
import 'dart:io';
import 'package:chattingapp/constants.dart';
import 'package:chattingapp/model/login_model.dart';
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


  Future<LoginResponseModel> verifyOP(LoginRequestModel requestModel) async {
    //IMPLEMENT USER LOGIN
    try {
      final response = await http.post(
        Uri.parse('${baseurl}verifyOTP'),
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

  
   Future<LoginResponseModel> requestOTP(LoginRequestModel requestModel) async {
    //IMPLEMENT USER LOGIN
    try {
      final response = await http.get(
        Uri.parse('${baseurl}reqOTP')
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

}