class ReqOTPResponseModel {
  final String? message;
  final String? error;

  ReqOTPResponseModel({this.message, this.error});

  factory ReqOTPResponseModel.fromJson(Map<String, dynamic> json) {
    return ReqOTPResponseModel(
      message: json["message"] ?? "",
      error: json["error"] ?? "",
    );
  }
}

class ReqOTPRequestModel {
  String? email;

  ReqOTPRequestModel({this.email});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "email": email!.trim(),
    };

    return map;
  }
}
