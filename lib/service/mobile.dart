import 'package:chattingapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MobileAuth {
  sendOTP(String email, context) async {
    try {
      final response =
          await http.get(Uri.parse('${baseurl}sendotp/${email.toString()}'));

      switch (response.statusCode) {
        case 200:
          final data = json.decode(response.body);
          return ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(data.toString())));
        case 400:
          final data = json.decode(response.body);
          return ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(data.toString())));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}
