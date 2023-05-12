import 'package:chattingapp/model/models.dart';

class Chats {
  final User? receiver;
  final ConversationModel? lastMessage;
  final int? unreadcount;
  final List<String>? filteredMessages;

  Chats({this.receiver, this.lastMessage, this.unreadcount, this.filteredMessages});

  factory Chats.fromJson(Map<String, dynamic> json) {
    return Chats(
      receiver: json["receiver"] ?? "",
      lastMessage: json["lastMessage"] ?? "",
      unreadcount: json["unreadcount"] ?? "",
      filteredMessages: json["filteredMessages"] ?? "",
    );
  }
}
