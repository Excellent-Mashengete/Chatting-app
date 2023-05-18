//Authentication response from the server used in all authentication exception verify OTP
class AuthResponseModel {
  final String? message;
  final String? error;

  AuthResponseModel({this.message, this.error});

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      message: json["message"] ?? "",
      error: json["error"] ?? "",
    );
  }
}

//Verify OTP response from login and create new password
class VerifyOTPResponseModel {
  final String? message;
  final String? error;
  final String? phone;
  final String? first;
  final String? last;
  final String? email;
  final String? token;
  final String? avatar;
  

  VerifyOTPResponseModel({this.message, this.error, this.phone, this.first, this.last, this.email, this.avatar, this.token});

  factory VerifyOTPResponseModel.fromJson(Map<String, dynamic> json) {
    return VerifyOTPResponseModel(
      message: json["message"] ?? "",
      error: json["error"] ?? "",
      phone: json["phone"] ?? "",
      first: json["first"] ?? "",
      last: json["last"] ?? "",
      email: json["email"] ?? "",
      token: json["token"] ?? "",
      avatar: json["avatar"] ?? "",
    );
  }
}

//Login request model
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

//Register Request
class RegisterRequestModel {
  String? firstname;
  String? lastname;
  String? email;
  String? password;
  String? phone;

  RegisterRequestModel(
      {this.firstname, this.lastname, this.email, this.phone, this.password});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "firstname": firstname!.trim(),
      "lastname": lastname!.trim(),
      "email": email!.trim(),
      "phone": phone!.trim(),
      "password": password!.trim()
    };

    return map;
  }
}

//Request OTP PIN
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

//Request a reset password
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

//Create a new password and confirm it
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