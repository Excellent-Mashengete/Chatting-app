import 'package:chattingapp/common/common.dart';
import 'package:chattingapp/constants.dart';
import 'package:chattingapp/model/models.dart';
import 'package:chattingapp/service/auth_api_service.dart';
import 'package:flutter/material.dart';
import 'package:chattingapp/widgets/widgets.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final ApiClient _resetapiClient = ApiClient();
  
  final emailController = TextEditingController();
  bool _validateEmail = false;
  bool _submitted = false;
  bool isApiCallProcessing = false;

  late ResetPassRequestModel resetPassRequestModel;

  @override
  void initState() {
    super.initState();
    resetPassRequestModel = ResetPassRequestModel();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  String? get _forgotpassError {
    final text = emailController.value.text;

    if (text.isEmpty) {
      return 'Enter valid email address or phone number';
    }

    // return null if the text is valid
    return null;
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
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'Forgot Password', 
        icon: Icons.arrow_back
      ),
      body: SafeArea(
        child: Center(
          child: ListView(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50),
                    const Text(
                      'Please enter email address or Phone number to reset the password',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),

                    const SizedBox(height: 20),
                    TextField(
                      controller: emailController,
                      obscureText: false,
                      keyboardType: TextInputType.text,
                      onChanged: (_) => setState(() {
                        _validateEmail = true;
                      }),
                      decoration: InputDecoration(
                        hintText: 'Email / Phone Number',
                        errorText:
                            _submitted || _validateEmail ? _forgotpassError : null,
                      ),
                    ),

                    const SizedBox(height: 100),

                    //Forgot Password button
                    ButtonWidget(
                      text: "RESET",
                      press: () {
                        if (emailController.text.isEmpty) {
                          setState(() {
                            _submitted = true;
                          });
                        } else {
                          setState(() {
                            _submitted = false;
                            isApiCallProcessing = true;
                          });
                          _handleResetPassword(emailController.text);
                        }
                      },
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

  Future<void> _handleResetPassword(String emailController) async {
    resetPassRequestModel.identifier = emailController.toLowerCase();

    _resetapiClient.passwordReset(resetPassRequestModel).then((value) => {
      // ignore: unnecessary_null_comparison
      if (value != null){
        setState(() {
          isApiCallProcessing = false;
        }),
        if (value.message!.isNotEmpty){
          ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(value.message!))
          ),
          Navigator.pushNamed(context, verifyforgotPassword, arguments: emailController)
        }else{
          ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(value.error!))
          ),
        }
      },
    });
  }
}
