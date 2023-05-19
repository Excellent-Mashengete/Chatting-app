import 'package:chattingapp/common/common.dart';
import 'package:chattingapp/constants.dart';
import 'package:chattingapp/model/models.dart';
import 'package:chattingapp/service/auth_api_service.dart';
import 'package:chattingapp/widgets/widgets.dart';
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
  final ApiClient _apiClient = ApiClient();
  final verify1Controller = TextEditingController();
  final verify2Controller = TextEditingController();
  final verify3Controller = TextEditingController();
  final verify4Controller = TextEditingController();
  bool isApiCallProcessing = false;

  late String message;
  late VerifyOTPRequestModel forgotPassVerifyRequestModel;
  late ReqOTPRequestModel requestOtpRequestModel;
 
  @override
  void initState() {
    super.initState();
    message = widget.data;
    forgotPassVerifyRequestModel = VerifyOTPRequestModel();
    requestOtpRequestModel = ReqOTPRequestModel();
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      inAsyncCall: isApiCallProcessing,
      opacity: 0.2,
      child: uiSetup(context),
    );
  }

  Widget uiSetup(BuildContext context) {
    return  Scaffold(
      appBar: const AppBarWidget(title: 'Verify Account', icon: Icons.arrow_back),
      body: SafeArea(
        child: Center(
          child: ListView(
            children: [
              Container(
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
                            setState(() {
                              isApiCallProcessing = true;
                            });
                            _handleRequestOTP();
                          },
                          child: const Text('Resend'),
                        ),

                        ElevatedButton(
                          style:ElevatedButton.styleFrom(
                            minimumSize:  const Size(150, 55),
                          ),
                          onPressed: (){
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
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _handleRequestOTP() async {
    requestOtpRequestModel.email = message.toLowerCase();
    _apiClient.requestOTP(requestOtpRequestModel).then((value) => {
      // ignore: unnecessary_null_comparison
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
    forgotPassVerifyRequestModel.email = message.toLowerCase();
    forgotPassVerifyRequestModel.otp = code1 + code2 + code3 + code4;

    _apiClient.verifyAccount(forgotPassVerifyRequestModel).then((value) => {
      // ignore: unnecessary_null_comparison
      if (value != null){
        setState(() {
          isApiCallProcessing = false;
        }),
        

        if (value.message!.isNotEmpty){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(value.message!))
          ),
          Navigator.pushNamed(context, enterNewPassword, arguments: message)
        }else{
          ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(value.error!))),
        }
      },
    });
  }
}