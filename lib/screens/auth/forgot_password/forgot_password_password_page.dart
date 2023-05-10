import 'package:chattingapp/model/models.dart';
import 'package:chattingapp/service/auth_api_service.dart';
import 'package:chattingapp/widgets/Input_Textfield_widget.dart';
import 'package:chattingapp/widgets/app_bar_widget.dart';
import 'package:chattingapp/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class EnterNewPassword extends StatefulWidget {
  const EnterNewPassword({
    Key? key,
    required this.data,
  }) : super(key: key);

  final String data;

  @override
  State<EnterNewPassword> createState() => _EnterNewPasswordState();
}

class _EnterNewPasswordState extends State<EnterNewPassword> {
    final ApiClient _resetapiClient = ApiClient();

  final newpasswordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  var _obscureText = true;
  var _confirmobscureText = true;
  bool _submitted = false;
  bool _validatePass = false;
  bool _validateConfPass = false;

  bool isApiCallProcessing = false;

  late String message;
  late ForgotNewPassRequestModel forgotNewPassRequestModel;

  @override
  void initState() {
    super.initState();
    message = widget.data;
    forgotNewPassRequestModel = ForgotNewPassRequestModel();
  }

  String? get _passwordError {
    final text = newpasswordController.value.text;

    if (text.isEmpty) {
      return 'Enter Password ';
    } else if (text.length < 5) {
      return 'Password Should be less than 5 characters';
    }

    // return null if the text is valid
    return null;
  }

  String? get _confirmpasswordError {
    final text = confirmpasswordController.value.text;
    final confirmText = newpasswordController.value.text;

    if (text.isEmpty) {
      return 'Enter Password ';
    } else if (text.length < 5) {
      return 'Password Should be less than 5 characters';
    } else if (text != confirmText) {
      return 'Password mismatch';
    }

    // return null if the text is valid
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'New Password', 
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          'Create your new password',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),
                    // Enter new password textfield
                    InputFields(
                      controller: newpasswordController,
                      icon: Icons.lock_rounded,
                      hintText: 'New Password',
                      obscureText: _obscureText,
                      errorText:
                          _submitted || _validatePass ? _passwordError : null,
                      isPassword: true,
                      onChange: (_) => setState(() {
                        _validatePass = true;
                      }),
                      textType: TextInputType.text,
                      changeVisibility: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),

                    const SizedBox(height: 30),

                    // confirm new password textfield
                    InputFields(
                      controller: confirmpasswordController,
                      icon: Icons.lock_rounded,
                      hintText: 'Confirm Password',
                      obscureText: _confirmobscureText,
                      errorText: _submitted || _validateConfPass
                          ? _confirmpasswordError
                          : null,
                      isPassword: true,
                      onChange: (_) => setState(() {
                        _validateConfPass = true;
                      }),
                      textType: TextInputType.text,
                      changeVisibility: () {
                        setState(() {
                          _confirmobscureText = !_confirmobscureText;
                        });
                      },
                    ),

                    //Forgot Password button
                    const SizedBox(height: 100),

                    ButtonWidget(
                      text: "Continue",
                      press: () {
                        if (newpasswordController.text.isEmpty &&
                            confirmpasswordController.text.isEmpty) {
                          setState(() {
                            _submitted = true;
                          });
                        } else {
                          setState(() {
                            _submitted = false;
                            //
                            isApiCallProcessing = true;
                          });
                          _handleLogin(newpasswordController.text,
                              confirmpasswordController.text);
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

  Future<void> _handleLogin(
      String newPassController, String confPassController) async {
    forgotNewPassRequestModel.identifier = message.toLowerCase();
    forgotNewPassRequestModel.newpassword = newPassController;
    forgotNewPassRequestModel.confirmPassword = confPassController;

    //get response from ApiClient
    _resetapiClient.newPassword(forgotNewPassRequestModel).then((value) => {
      // ignore: unnecessary_null_comparison
      if (value != null){
        setState(() {
          isApiCallProcessing = false;
        }),
        if (value.message!.isNotEmpty){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(value.message!))
          ),
        //  Navigator.pushNamed(context, homepage)
        }
        else{
          ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(value.error!))
          )
        }
      },
    });
  }
}
