
import 'package:chattingapp/screens/auth/forgot_password/forgot_password_email_page.dart';
import 'package:chattingapp/screens/auth/login/login_page.dart';
import 'package:chattingapp/screens/auth/verifyotp/verifyotp.dart';
import 'package:chattingapp/screens/landing/landing_page.dart';
import 'package:chattingapp/screens/tabs/tabs.dart';
import 'package:flutter/material.dart';
import 'package:chattingapp/constants.dart';


class MyRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case landing:
        return MaterialPageRoute(builder: (context) => const Landing());
      case homepage:
        return MaterialPageRoute(builder: (context) => const NavTabs());
      case login:
        return MaterialPageRoute(builder: (context) => const Login());
      case forgotpassword:
        return MaterialPageRoute(builder: (context) => const ForgotPassword());
      case verifyOtp:
        return MaterialPageRoute(builder: (context) => const VerifyOTP());
      default:
    }

    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: const Text('Error')
        ),
        body: const Center(
          child: Text('Exception: No routes for this location')
        ),
      ),
    );
  }
}
