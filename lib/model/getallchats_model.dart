import 'package:chattingapp/model/chat_model.dart';

class ChatResponseModel {
  final String? message;
  final String? error;
  final List<Chats>? chats;

  ChatResponseModel({this.message, this.error, this.chats});

  factory ChatResponseModel.fromJson(Map<String, dynamic> json) {
    var list = json["chats"] ?? "" as List;
    List<Chats> chatlist = list.map((x) => Chats.fromJson(x)).toList();
    return ChatResponseModel(
      message: json["message"] ?? "",
      error: json["error"] ?? "",
      chats: chatlist,
    );
  }
}
