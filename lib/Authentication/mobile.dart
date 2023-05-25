import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';

class MobileAuth {
  final EmailAuth _emailAuth = EmailAuth(
    sessionName: "Verify user account",
  );
   

  Future<void> sendOTP(String email, context) async {
   
    bool result = await _emailAuth.sendOtp(recipientMail: email, otpLength: 4);
    if (result) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('OTP has been sent')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Oops, unable to send OTP')));
    }
  }

  Future<void> verifyOTP(String email, String otp, context) async {
    final result = _emailAuth.validateOtp(recipientMail: email, userOtp: otp);
    if (result) {
      ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('OTP is Verified')));
    } else {
      ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Invalid OTP')));
    }
  }
}

/*
  Future<void> verifyOTP(String email, String otp, context) async {
    await _emailAuth.setConfig(
      appEmail: "noreply@chatting.com",
      appName: "Email OTP",
      userEmail: email,
      otpLength: 4,
      otpType: OTPType.digitsOnly
    );
    
    final result = _emailAuth.verifyOTP(otp: otp);
    if (result == true) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('OTP is Verified')));
      Navigator.pushNamed(context, homepage);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Invalid OTP')));
    }
  }
  */