//Request email token 
class ResetPassResponseModel {
  final String? message;
  final String? error;

  ResetPassResponseModel({this.message, this.error});

  factory ResetPassResponseModel.fromJson(Map<String, dynamic> json) {
    return ResetPassResponseModel(
      message: json["message"] ?? "",
      error: json["error"] ?? "",
    );
  }
}

class ResetPassRequestModel {
  String? identifier;

  ResetPassRequestModel({this.identifier});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "identifier": identifier!.trim(),
    };

    return map;
  }
}
