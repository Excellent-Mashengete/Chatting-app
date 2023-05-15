import 'package:chattingapp/model/models.dart';

class Chats {
  final User? receiver;
  final ConversationModel? lastMessage;
  final int? unreadcount;
  final List<ConversationModel>? filteredMessages;

  Chats(
      {this.receiver,
      this.lastMessage,
      this.unreadcount,
      this.filteredMessages});

  factory Chats.fromJson(Map<String, dynamic> json) {
    var messList = json["filteredMessages"] ?? "" as List;
    List<ConversationModel> messages = messList
        .map((x) => ConversationModel.fromJson(x))
        .toList();

    return Chats(
        receiver: json["receiver"] ?? "",
        lastMessage: json["lastMessage"] ?? "",
        unreadcount: json["unreadcount"] ?? "",
        filteredMessages: messages);
  }
}
