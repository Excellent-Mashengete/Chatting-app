import 'dart:ffi';

class VerifyOTPResponseModel {
  final String? message;
  final String? error;
  final String? phone;
  final String? name;
  final String? token;

  VerifyOTPResponseModel({this.message, this.error, this.phone, this.name, this.token});

  factory VerifyOTPResponseModel.fromJson(Map<String, dynamic> json) {
    return VerifyOTPResponseModel(
      message: json["message"] ?? "",
      error: json["error"] ?? "",
      phone: json["phone"] ?? "",
      name: json["name"] ?? "",
      token: json["token"] ?? "",
    );
  }
}

class VerifyOTPRequestModel {
  String? email;
  String? otp;

  VerifyOTPRequestModel({this.email, this.otp});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "email": email!.trim(),
      "OTP": otp!.trim()
    };

    return map;
  }
}
