import 'dart:convert';
import 'dart:io';
import 'package:chattingapp/Authentication/authentication.dart';
import 'package:chattingapp/constants.dart';
import 'package:chattingapp/model/models.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

class MessageApiClient {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<ChatResponseModel> getAllChats() async {
    final user = _firebaseAuth.currentUser;
    final userId = user!.uid;

    try {
      final response = await http.get(
        Uri.parse('${baseurl}getchats/userId'),
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
