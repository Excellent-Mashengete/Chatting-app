import 'package:chattingapp/widgets/button_widget.dart';
import 'package:chattingapp/widgets/otpPin.dart';
import 'package:flutter/material.dart';

class VerifyOTP extends StatefulWidget {

  const VerifyOTP({
      Key? key,
      this.identifier,
      this.hash
    }
  ) :super(key:key);
 
  final String? identifier;
  final String? hash;
  
  @override
  State<VerifyOTP> createState() => _MyVerifyOTPState();
}

class _MyVerifyOTPState extends State<VerifyOTP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 100),
                  Image.network(
                    "https://i.imgur.com/bOCEVJg.png",
                    height: 180,
                    fit: BoxFit.contain,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Center(
                      child: Text('We have send the verification code to',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const Text(
                    '+27******5147',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  OTPPin(),
                  OTPPin(),
                  OTPPin(),
                  OTPPin(),
                ],
              ),
              const SizedBox(height: 150),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonWidget(
                    text: "Resend",
                    //width: double.parse('160'),
                    border: Border.all(width: 1, color: Colors.black),
                  ),
                  ButtonWidget(
                    text: "Confirm",
                    // width: double.parse('160'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
