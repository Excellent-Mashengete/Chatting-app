import 'package:chattingapp/common/hideemailwithasteriks.dart';
import 'package:chattingapp/constants.dart';
import 'package:chattingapp/widgets/otpPin.dart';
import 'package:flutter/material.dart';

class VerifyOTP extends StatefulWidget {
  const VerifyOTP({
    Key? key,
    required this.data,
  }) : super(key: key);

  final String data;

  @override
  State<VerifyOTP> createState() => _MyVerifyOTPState();
}

class _MyVerifyOTPState extends State<VerifyOTP> {
  final verify1Controller = TextEditingController();
  final verify2Controller = TextEditingController();
  final verify3Controller = TextEditingController();
  final verify4Controller = TextEditingController();

  String email = maskEmail('mashengete@live.com');

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  Image.network(
                    "https://i.imgur.com/bOCEVJg.png",
                    height: 180,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 20),

                  const Text(
                    'Please enter email address or Phone number to reset the password',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 20),
                  Text(email),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OTPPin(
                        controller: verify1Controller,
                        hintText: '0',
                      ),
                      OTPPin(
                        controller: verify2Controller,
                        hintText: '0',
                      ),
                      OTPPin(
                        controller: verify3Controller,
                        hintText: '0',
                      ),
                      OTPPin(
                        controller: verify4Controller,
                        hintText: '0',
                      ),
                    ],
                  ),

                  // sign in button
                  const SizedBox(height: 80),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(150, 55),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, homepage);
                          },
                          child: const Text('Resend'),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(150, 55),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, homepage);
                          },
                          child: const Text('Verify OTP'),
                        ),
                      ]),
                ],
              ))),
    ));
  }
}
