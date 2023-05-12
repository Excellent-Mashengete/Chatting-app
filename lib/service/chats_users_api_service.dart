import 'dart:convert';
import 'dart:io';
import 'package:chattingapp/constants.dart';
import 'package:chattingapp/model/models.dart';
import 'package:http/http.dart' as http;
import 'package:hive_flutter/hive_flutter.dart';
late Box box1;

class MessageApiClient {
  Future<ChatResponseModel>getAllChats() async {
      await Hive.initFlutter();
      box1 = await Hive.openBox('user'); 

    try {
      final response = await http.get(
        Uri.parse('${baseurl}getchats'),
        headers: {"authorization": box1.get('user_token')},
      );

      switch (response.statusCode) {
        case 200:
          final data = json.decode(response.body);
          return ChatResponseModel.fromJson(data);
        case 401:
          final data = json.decode(response.body);
          return ChatResponseModel.fromJson(data);

        case 403:
          final data = json.decode(response.body);
          return ChatResponseModel.fromJson(data);
        default:
          throw Exception(response.body);
      }
    } on SocketException catch (_) {
      rethrow;
    }
  }
}
