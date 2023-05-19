import 'package:chattingapp/common/common.dart';
import 'package:chattingapp/constants.dart';
import 'package:chattingapp/model/models.dart';
import 'package:chattingapp/providers/provider.dart';
import 'package:provider/provider.dart';
import 'package:chattingapp/service/auth_api_service.dart';
import 'package:chattingapp/widgets/widgets.dart';
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
  final _formKey = GlobalKey<FormState>();
  final newpasswordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  var _obscureText = true;
  var _confirmobscureText = true;
  bool isApiCallProcessing = false;

  late String message;
  late ForgotNewPassRequestModel forgotNewPassRequestModel;

  @override
  void initState() {
    super.initState();
    message = widget.data;
    forgotNewPassRequestModel = ForgotNewPassRequestModel();
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
    var user = Provider.of<GetUser>(context, listen: false);
    return Scaffold(
      appBar: const AppBarWidget(title: 'New Password', icon: Icons.arrow_back),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Create your new password',
                    style: TextStyle(
                      color: ThemeConstants.light1Color.withOpacity(0.7),
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 50),
                  // Enter new password textfield
                  InputFields(
                    controller: newpasswordController,
                    hintText: 'Password',
                    icon: Icons.lock_rounded,
                    textType: TextInputType.visiblePassword,
                    obscureText: _obscureText,
                    isPassword: true,
                    changeVisibility: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 5) {
                        return "Password must be at least 6 characters";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 40),

                  InputFields(
                    controller: confirmpasswordController,
                    hintText: 'Confirm Password',
                    icon: Icons.lock_rounded,
                    textType: TextInputType.visiblePassword,
                    obscureText: _confirmobscureText,
                    isPassword: true,
                    changeVisibility: () {
                      setState(() {
                        _confirmobscureText = !_confirmobscureText;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter confirm password';
                      } else if (value.compareTo(newpasswordController.text) !=
                          0) {
                        return 'Password mismatch';
                      } else if (value.length < 5) {
                        return "confirm password must be at least 6 characters";
                      }
                      return null;
                    },
                  ),
                  //Forgot Password button
                  const SizedBox(height: 50),
                  ButtonWidget(
                    text: "Reset Password",
                    press: () {
                      final valid = _formKey.currentState!.validate();
                      if (valid) {
                        setState(() {
                          isApiCallProcessing = true;
                        });
                        
                        _handleConfirmNewPassword(user);
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

  Future<void> _handleConfirmNewPassword(GetUser user) async {
    forgotNewPassRequestModel.identifier = message.toLowerCase();
    forgotNewPassRequestModel.newpassword = newpasswordController.text;
    forgotNewPassRequestModel.confirmPassword = confirmpasswordController.text;

    //get response from ApiClient
    _resetapiClient.newPassword(forgotNewPassRequestModel).then(
          (value) => {
            // ignore: unnecessary_null_comparison
            if (value != null)
              {
                setState(() {
                  isApiCallProcessing = false;
                }),
                if (value.message!.isNotEmpty)
                  {
                    user.addItem(User(
                      name: value.user!.name,
                      email: value.user!.email,
                      phoneNumber: value.user!.phone,
                      avatar: value.user!.avatar 
                      ),
                    ),
                    user.addToken(Token(token:value.token!)), //Add data to hive local database on the mobile
                    
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(value.message!))),
                    //Navigator.pushNamed(context, homepage)
                  }
                else
                  {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(value.error!)))
                  }
              },
          },
        );
  }
}
