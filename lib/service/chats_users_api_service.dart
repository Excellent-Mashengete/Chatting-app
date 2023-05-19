import 'dart:convert';
import 'dart:io';
import 'package:chattingapp/constants.dart';
import 'package:chattingapp/model/models.dart';
import 'package:http/http.dart' as http;

class MessageApiClient {
  // Future<ChatResponseModel> getAllChats() async {
    
  //   var token = "";
  //   print(token);

  //   try {
  //     final response = await http.get(
  //       Uri.parse('${baseurl}getchats'),
  //       headers: {"authorization": token},
  //     );

  //     switch (response.statusCode) {
  //       case 200:
  //         final data = json.decode(response.body);
  //         return ChatResponseModel.fromJson(data);
  //       case 401:
  //         final data = json.decode(response.body);
  //         return ChatResponseModel.fromJson(data);

  //       case 403:
  //         final data = json.decode(response.body);
  //         return ChatResponseModel.fromJson(data);
  //       default:
  //         throw Exception(response.body);
  //     }
  //   } on SocketException catch (_) {
  //     rethrow;
  //   }
  // }
}
