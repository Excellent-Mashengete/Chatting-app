class LoginResponseModel {
  final String? message;
  final String? error;

  LoginResponseModel({this.message, this.error});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      message: json["message"] ?? "",
      error: json["error"] ?? "",
    );
  }
}

class LoginRequestModel {
  String? identifier;
  String? password;

  LoginRequestModel({this.identifier, this.password});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "identifier": identifier!.trim(),
      "password": password!.trim()
    };

    return map;
  }
}
