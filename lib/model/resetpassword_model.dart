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


//Verify  ForgotPassRequestMode
class ForgotVerifyResponseModel {
  final String? message;
  final String? error;

  ForgotVerifyResponseModel({this.message, this.error});

  factory ForgotVerifyResponseModel.fromJson(Map<String, dynamic> json) {
    return ForgotVerifyResponseModel(
      message: json["message"] ?? "",
      error: json["error"] ?? "",
    );
  }
}

class ForgotVerifyOTPRequestModel {
  String? identifier;
  String? otp;

  ForgotVerifyOTPRequestModel({this.identifier, this.otp});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "email": identifier!.trim(),
      "OTP": otp!.trim()
    };

    return map;
  }
}

//Enter new and confirm ForgotPassRequestMode
class ForgotNewPassResponseModel {
  final String? message;
  final String? error;

  ForgotNewPassResponseModel({this.message, this.error});

  factory ForgotNewPassResponseModel.fromJson(Map<String, dynamic> json) {
    return ForgotNewPassResponseModel(
      message: json["message"] ?? "",
      error: json["error"] ?? "",
    );
  }
}

class ForgotNewPassRequestModel {
  String? identifier;
  String? newpassword;
  String? confirmPassword;

  ForgotNewPassRequestModel({this.identifier, this.newpassword, this.confirmPassword});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "identifier": identifier!.trim(),
      "newpassword": newpassword!.trim(),
      "confirmPassword": confirmPassword!.trim()
    };

    return map;
  }
}