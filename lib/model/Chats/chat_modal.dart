class ChatResponseModel {
  final String? error;
  final List<Conversation>? chats;

  ChatResponseModel({this.error, this.chats});

  factory ChatResponseModel.fromJson(Map<String, dynamic> json) {
    return ChatResponseModel(
      error: json["error"] ?? "",
      chats: (json["chats"] as List<dynamic>?)?.map((x) => Conversation.fromJson(x)).toList(), 
    );
  }
}

//chats array 
class Conversation {
  final UserData? receiver;
  final LastMessageModel? lastMessage;
  final int? unreadcount;
  final List<LastMessageModel>? filteredMessages;

  Conversation(
      {this.receiver,
      this.lastMessage,
      this.unreadcount,
      this.filteredMessages});

  factory Conversation.fromJson(Map<String, dynamic> json) {
    var list = json["filteredMessages"] as List;
    List<LastMessageModel> messageList = list.map((x) => LastMessageModel.fromJson(x)).toList();
    return Conversation(
      receiver: UserData.fromJson(json["receiver"]),
      lastMessage: LastMessageModel.fromJson(json["lastMessage"]),
      unreadcount: json["unreadcount"] ?? "",
      filteredMessages: messageList,
    );
  }
}

//messages array
class LastMessageModel {
  final String? messages;
  final bool? read;
  final int? receiver;
  final int? sender;
  final DateTime? datesend;
  final UserData? user;
  final UserData? receipient;

  LastMessageModel({
    this.messages,
    this.read,
    this.receiver,
    this.sender,
    this.datesend,
    this.user,
    this.receipient
  });

  factory LastMessageModel.fromJson(Map<String, dynamic> json) {
    return LastMessageModel(
      messages: json["messages"] ?? "",
      read: json["read"] ?? "",
      receiver: json["receiver"] ?? "",
      sender: json["sender "] ?? "",
      datesend: json["datesend "] ?? "",
      user: UserData.fromJson(json["user"]),
      receipient: UserData.fromJson(json["receipient"]),
    );
  }
}

//receipient and sernder model
class UserData {
  final int? id;
  final String? name;
  final String? phone;
  final String? avatar;

  UserData({this.id, this.name, this.phone, this.avatar});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json["id"] ?? "",
      name: json["name"] ?? "",
      phone: json["phone"] ?? "",
      avatar: json["avatar"] ?? "",
    );
  }
}
