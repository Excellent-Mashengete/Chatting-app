import 'package:chattingapp/common/hideemailwithasteriks.dart';
import 'package:chattingapp/common/loader.dart';
import 'package:chattingapp/constants.dart';
import 'package:chattingapp/model/reqotp_model.dart';
import 'package:chattingapp/model/verifyOTp_model.dart';
import 'package:chattingapp/service/auth_api_service.dart';
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
  final ApiClient _apiClient = ApiClient();
  final verify1Controller = TextEditingController();
  final verify2Controller = TextEditingController();
  final verify3Controller = TextEditingController();
  final verify4Controller = TextEditingController();
  bool isApiCallProcessing = false;

  late String message;
  late VerifyOTPRequestModel verifyRequestModel;
  late ReqOTPRequestModel requestOtpRequestModel;

  @override
  void initState() {
    super.initState();
    message = widget.data;
    verifyRequestModel = VerifyOTPRequestModel();
    requestOtpRequestModel = ReqOTPRequestModel();
  }

  // late String email = maskEmail(message);

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      inAsyncCall: isApiCallProcessing,
      opacity: 0.2,
      child: uiSetup(context),
    );
  }

  Widget uiSetup(BuildContext context) {
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
                // Text(email),
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
                        _handleRequestOTP();
                      },
                      child: const Text('Resend'),
                    ),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(150, 55),
                      ),
                      onPressed: () {
                        setState(() {
                          isApiCallProcessing = true;
                        });

                        _handleVerifyOTP(
                          verify1Controller.text,
                          verify2Controller.text,
                          verify3Controller.text,
                          verify4Controller.text
                        );
                      },
                      child: const Text('Verify OTP'),
                    ),
                  ]
                ),
              ],
            )
          )
        ),
      )
    );
  }
 
  Future<void> _handleRequestOTP() async {
    requestOtpRequestModel.email = message.toLowerCase();
    _apiClient.requestOTP(requestOtpRequestModel).then((value) => {
      if (value != null){
        setState(() {
          isApiCallProcessing = false;
        }),

        if (value.message!.isNotEmpty){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(value.message!))
          ),
        }else{
          ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(value.error!))),
        }
      },
    });
  }

  Future<void> _handleVerifyOTP(
      String code1, String code2, String code3, String code4) async {
    verifyRequestModel.email = message.toLowerCase();
    verifyRequestModel.otp = code1 + code2 + code3 + code4;

    _apiClient.verifyOP(verifyRequestModel).then((value) => {
      if (value != null){
        setState(() {
          isApiCallProcessing = false;
        }),

        if (value.message!.isNotEmpty){
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Login Successful'))
          ),
          Navigator.pushNamed(context, homepage)
        }else{
          ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(value.error!))),
        }
      },
    });
  }
}
