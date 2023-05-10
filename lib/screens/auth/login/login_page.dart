import 'package:chattingapp/common/assets.dart';
import 'package:chattingapp/common/loader.dart';
import 'package:chattingapp/common/theme.dart';
import 'package:chattingapp/constants.dart';
import 'package:chattingapp/model/models.dart';
import 'package:chattingapp/service/auth_api_service.dart';
import 'package:chattingapp/widgets/Input_Textfield_widget.dart';
import 'package:chattingapp/widgets/app_bar_widget.dart';
import 'package:chattingapp/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final ApiClient _apiClient = ApiClient();

  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var _obscureText = true;
  bool _submitted = false;
  bool _validateEmail = false;
  bool _validatePass = false;
  bool isApiCallProcessing = false;

  late LoginRequestModel loginRequestModel;

  @override
  void initState() {
    super.initState();
    loginRequestModel = LoginRequestModel();
  }

  String? get _emailError {
    final text = emailController.value.text;

    //Validate the email format
    bool isemailvalid =
        RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(text);

    if (text.isEmpty) {
      return 'Enter Email Address';
    } else if (!isemailvalid) {
      return 'Enter Valid Email';
    }

    // return null if the text is valid
    return null;
  }

  String? get _passwordError {
    final text = passwordController.value.text;

    if (text.isEmpty) {
      return 'Enter Password ';
    } else if (text.length < 5) {
      return 'Password Should be less than 5 characters';
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
        title: '', 
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
                    const SizedBox(height: 25),
                    const Icon(Icons.lock, size: 80),
                    const SizedBox(height: 20),
                    const Text(
                      'Login to Your Account',
                      style: TextStyle(
                        fontSize: 20,
                        color:ThemeConstants.light1Color,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // email textfield
                    InputFields(
                      controller: emailController,
                      icon: Icons.email,
                      hintText: 'Email',
                      obscureText: false,
                      isPassword: false,
                      errorText:
                        _submitted || _validateEmail ? _emailError : null,
                      onChange: (_) => setState(() {
                        _validateEmail = true;
                      }),
                      textType: TextInputType.emailAddress
                    ),
                    const SizedBox(height: 20),
                    // password textfield
                    InputFields(
                      controller: passwordController,
                      icon: Icons.lock_rounded,
                      hintText: 'Password',
                      obscureText: _obscureText,
                      isPassword: true,
                      errorText:
                          _submitted || _validatePass ? _passwordError : null,
                      textType: TextInputType.text,
                      onChange: (_) => setState(() {
                        _validatePass = true;
                      }),
                      changeVisibility: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                    // sign in button
                    const SizedBox(height: 50),
                    ButtonWidget(
                      text: "Login",
                      press: () {
                        if (emailController.text.isEmpty &&
                            passwordController.text.isEmpty) {
                          setState(() {
                            _submitted = true;
                          });
                        } else {
                          setState(() {
                            _submitted = false;
                            //
                            isApiCallProcessing = true;
                          });
                          _handleLogin(
                              emailController.text, passwordController.text);
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    // forgot password?
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don`t have an account?',
                              style: TextStyle(
                                color:ThemeConstants.light1Color.withOpacity(0.7),
                              ),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 16),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, register);
                              },
                              child: const Text('Sign Up'),
                            ),
                          ],
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 16),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, forgotpassword);
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color:ThemeConstants.light1Color.withOpacity(0.7),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    _SocialButtons(),
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
      String emailController, String passwordController) async {
    loginRequestModel.identifier = emailController.toLowerCase();
    loginRequestModel.password = passwordController;

    //get response from ApiClient
    _apiClient.login(loginRequestModel).then((value) => {
          // ignore: unnecessary_null_comparison
          if (value != null)
            {
              setState(() {
                isApiCallProcessing = false;
              }),
              if (value.message!.isNotEmpty)
                {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Login Successful'))),
                  Navigator.pushNamed(context, verifyOtp,
                      arguments: emailController)
                }
              else
                {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(value.error!)))
                }
            },
        });
  }
}

class _SocialButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min, 
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: ThemeConstants.dark2Color,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
              child: SvgPicture.asset(AssetConstants.googleImage)
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: ThemeConstants.dark2Color,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
              child: SvgPicture.asset(AssetConstants.appleImage)
            ),
          ),
        ),
      ]
    );
  }
}