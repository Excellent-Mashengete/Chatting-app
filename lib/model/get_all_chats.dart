class ChatResponseModel {
  final String? message;
  final String? error;

  ChatResponseModel({this.message, this.error});

  factory ChatResponseModel.fromJson(Map<String, dynamic> json) {
    return ChatResponseModel(
      message: json["message"] ?? "",
      error: json["error"] ?? "",
    );
  }
}

class ChatRequestModel {
  String? identifier;
  String? password;

  ChatRequestModel({this.identifier, this.password});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "identifier": identifier!.trim(),
      "password": password!.trim()
    };

    return map;
  }
}
