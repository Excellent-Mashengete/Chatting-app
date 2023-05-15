import 'package:chattingapp/model/message_data.dart';
import 'package:chattingapp/screens/auth/auths.dart';
import 'package:chattingapp/screens/tabs/tabs.dart';
import 'package:chattingapp/screens/landing/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:chattingapp/constants.dart';

class MyRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case landing:
        return MaterialPageRoute(builder: (context) => const Landing());
      case homepage:
        return MaterialPageRoute(builder: (context) => const NavTabs());
      case login:
        return MaterialPageRoute(builder: (context) => const Login());
      case register:
        return MaterialPageRoute(builder: (context) => const Register());
      case forgotpassword:
        return MaterialPageRoute(builder: (context) => const ForgotPassword());
      case enterNewPassword:
        if (args is String) {
          return MaterialPageRoute(
            builder: (context) => EnterNewPassword(
              data: args,
            ),
          );
        }
        return _errorRoute();
      case verifyOtp:
        if (args is String) {
          return MaterialPageRoute(
            builder: (context) => VerifyOTP(
              data: args,
            ),
          );
        }
        return _errorRoute();
      case verifyforgotPassword:
        if (args is String) {
          return MaterialPageRoute(
            builder: (context) => VerifyForgotPassword(
              data: args,
            ),
          );
        }
        return _errorRoute();

      case messages:
        if (args is MessageData) {
          return MaterialPageRoute(
            builder: (context) => Messages(
              messageData: args,
            ),
          );
        }
        return _errorRoute();
      case camera:
        return MaterialPageRoute(builder: (context) => const CameraScreen());
      default:
        //if there is no such named route in the switch statement, return error route
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body:
            const Center(child: Text('Exception: No routes for this location')),
      );
    });
  }
}
