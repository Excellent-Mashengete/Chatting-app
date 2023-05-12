class ChatResponseModel {
  final String? message;
  final String? error;
  final List<String>? chats;

  ChatResponseModel({this.message, this.error, this.chats});

  factory ChatResponseModel.fromJson(Map<String, dynamic> json) {
    return ChatResponseModel(
      message: json["message"] ?? "",
      error: json["error"] ?? "",
      chats: json["chats"] ?? "",
    );
  }
}
