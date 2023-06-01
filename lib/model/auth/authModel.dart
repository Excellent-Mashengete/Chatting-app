//Verify OTP response from login and create new password
class VerifyOTPResponseModel {
  final String? message;
  final String? error;

  VerifyOTPResponseModel({this.message, this.error});

  factory VerifyOTPResponseModel.fromJson(Map<String, dynamic> json) {
    return VerifyOTPResponseModel(
      message: json["message"] ?? "",
      error: json["error"] ?? "",
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
      "otpin": otp!.trim()
    };

    return map;
  }
}