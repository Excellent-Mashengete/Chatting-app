import 'package:chattingapp/model/models.dart';

class ConversationModel {
  final String? messages;
  final bool? read;
  final int? receiver;
  final int? sender;
  final DateTime? datesend;
  final User? user;
  final User? receipient;

  ConversationModel({ this.messages, this.read, this.receiver, this.sender, this.datesend, this.user, this.receipient });

  factory ConversationModel.fromJson(Map<String, dynamic> json) {
    return ConversationModel(
      messages: json["messages"] ?? "",
      read: json["read"] ?? "",
      receiver: json["receiver"] ?? "",
      sender: json["sender"] ?? "",
      datesend: json["datesend"] ?? "",
      user: json['user'] ?? "",
      receipient: json['receipient'] ?? "",
    );
  }
}