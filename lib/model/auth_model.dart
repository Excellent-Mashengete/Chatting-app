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
  final String? token;
  final UserProfile? user;

  VerifyOTPResponseModel({this.message, this.error, this.token, this.user});

  factory VerifyOTPResponseModel.fromJson(Map<String, dynamic> json) {
    return VerifyOTPResponseModel(
      message: json["message"] ?? "",
      error: json["error"] ?? "",
      token: json["token"] ?? "",
      user: UserProfile.fromJson(json["user"]),
    );
  }
}

class UserProfile {
  final String? name;
  final String? email;
  final String? phone;
  final String? avatar;

  UserProfile({this.name, this.email, this.phone, this.avatar});

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      name: json["name"] ?? "",
      email: json["email"] ?? "",
      phone: json["phone"] ?? "",
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
  String? name;
  String? email;
  String? password;
  String? phone;

  RegisterRequestModel({this.name, this.email, this.phone, this.password});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "name": name!.trim(),
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

  ForgotNewPassRequestModel(
      {this.identifier, this.newpassword, this.confirmPassword});

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
    Map<String, dynamic> map = {"email": email!.trim(), "OTP": otp!.trim()};

    return map;
  }
}

class LogInWithGoogleFailure implements Exception {
  /// {@macro log_in_with_google_failure}
  const LogInWithGoogleFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  factory LogInWithGoogleFailure.fromCode(String code) {
    switch (code) {
      case 'account-exists-with-different-credential':
        return const LogInWithGoogleFailure(
          'Account exists with different credentials.',
        );
      case 'invalid-credential':
        return const LogInWithGoogleFailure(
          'The credential received is malformed or has expired.',
        );
      case 'operation-not-allowed':
        return const LogInWithGoogleFailure(
          'Operation is not allowed.  Please contact support.',
        );
      case 'user-disabled':
        return const LogInWithGoogleFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const LogInWithGoogleFailure(
          'Email is not found, please create an account.',
        );
      case 'wrong-password':
        return const LogInWithGoogleFailure(
          'Incorrect password, please try again.',
        );
      case 'invalid-verification-code':
        return const LogInWithGoogleFailure(
          'The credential verification code received is invalid.',
        );
      case 'invalid-verification-id':
        return const LogInWithGoogleFailure(
          'The credential verification ID received is invalid.',
        );
      default:
        return const LogInWithGoogleFailure();
    }
  }

  /// The associated error message.
  final String message;
}
