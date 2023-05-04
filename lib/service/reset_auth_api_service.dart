import 'dart:convert';
import 'dart:io';
import 'package:chattingapp/constants.dart';
import 'package:chattingapp/model/resetpassword_model.dart';
import 'package:http/http.dart' as http;

class RestApiClient {
  Future<ResetPassResponseModel> passwordReset(ResetPassRequestModel requestModel) async {
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
}
