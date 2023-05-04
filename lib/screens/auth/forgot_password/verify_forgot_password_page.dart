import 'package:chattingapp/constants.dart';
import 'package:chattingapp/widgets/app_bar_widget.dart';
import 'package:chattingapp/widgets/otpPin.dart';
import 'package:flutter/material.dart';

class VerifyForgotPassword extends StatefulWidget {
  const VerifyForgotPassword({
    Key? key,
    required this.data,
  }) : super(key: key);

  final String data;
  @override
  State<VerifyForgotPassword> createState() => _VerifyForgotPasswordState();
}

class _VerifyForgotPasswordState extends State<VerifyForgotPassword> {
  final verify1Controller = TextEditingController();
  final verify2Controller = TextEditingController();
  final verify3Controller = TextEditingController();
  final verify4Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const AppBarWidget(title: 'Verify Account', icon: Icons.arrow_back),
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
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
                const SizedBox(height: 15),
                const Text(
                  '+27******5147',
                ),
                const SizedBox(height: 15),
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
                const SizedBox(height: 70),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style:ElevatedButton.styleFrom(
                        minimumSize:  const Size(150, 55),
                      ),
                      onPressed: (){
                        Navigator.pushNamed(context, homepage);
                      },
                      child: const Text('Resend'),
                    ),

                    ElevatedButton(
                      style:ElevatedButton.styleFrom(
                        minimumSize:  const Size(150, 55),
                      ),
                      onPressed: (){
                        Navigator.pushNamed(context, enterNewPassword);
                      },
                      child: const Text('Verify OTP'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}