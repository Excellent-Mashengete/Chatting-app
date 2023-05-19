import 'package:chattingapp/common/common.dart';
import 'package:chattingapp/constants.dart';
import 'package:chattingapp/model/models.dart';
import 'package:chattingapp/service/auth_api_service.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:chattingapp/widgets/widgets.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final ApiClient _resetapiClient = ApiClient();
  late ResetPassRequestModel resetPassRequestModel;

  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  bool isApiCallProcessing = false;

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
      appBar:
          const AppBarWidget(title: 'Forgot Password', icon: Icons.arrow_back),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  const Text(
                    'Please enter email address to reset the password',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  ),

                  const SizedBox(height: 20),
                  InputFields(
                    controller: emailController,
                    hintText: 'Email',
                    icon: Icons.email,
                    textType: TextInputType.emailAddress,
                    obscureText: false,
                    isPassword: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Email Address';
                      } else if (!EmailValidator.validate(value)) {
                        return 'Enter Valid Email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 100),

                  //Forgot Password button
                  ButtonWidget(
                    text: "Reset Password",
                    press: () {
                      final valid = _formKey.currentState!.validate();
                      if (valid) {
                        setState(() {
                          isApiCallProcessing = true;
                        });
                        
                        _handleResetPassword();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _handleResetPassword() async {
    resetPassRequestModel.identifier = emailController.text.toLowerCase();
    _resetapiClient.passwordReset(resetPassRequestModel).then((value) => {
          // ignore: unnecessary_null_comparison
          if (value != null)
            {
              setState(() {
                isApiCallProcessing = false;
              }),
              if (value.message!.isNotEmpty)
                {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(value.message!))),
                  Navigator.pushNamed(context, verifyforgotPassword,
                      arguments: emailController.text.toLowerCase())
                }
              else
                {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(value.error!))),
                }
            },
        });
  }
}
