import 'package:chattingapp/common/assets.dart';
import 'package:chattingapp/common/loader.dart';
import 'package:chattingapp/common/theme.dart';
import 'package:chattingapp/constants.dart';
import 'package:chattingapp/model/models.dart';
import 'package:chattingapp/service/auth_api_service.dart';
import 'package:chattingapp/widgets/Input_Textfield_widget.dart';
import 'package:chattingapp/widgets/app_bar_widget.dart';
import 'package:chattingapp/widgets/button_widget.dart';
import 'package:chattingapp/widgets/input_Phone_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_field/phone_number.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final ApiClient _apiClient = ApiClient();

  // text editing controllers
  final firstController = TextEditingController();
  final lastController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  var _obscureText = true;
  bool _submitted = false;
  bool _validateEmail = false;
  bool _validatefirst = false;
  bool _validatelast = false;
  bool _validatePass = false;
  bool isApiCallProcessing = false;

  late RegisterRequestModel registerRequestModel;

  @override
  void initState() {
    super.initState();
    registerRequestModel = RegisterRequestModel();
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
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

  String? get _firstError {
    final text = firstController.value.text;

    if (text.isEmpty) {
      return 'Enter First Name';
    }

    // return null if the text is valid
    return null;
  }

  String? get _lastError {
    final text = lastController.value.text;

    if (text.isEmpty) {
      return 'Enter Last Name';
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
      appBar: const AppBarWidget(title: '', icon: Icons.arrow_back),
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
                      'Create Your Account',
                      style: TextStyle(
                        fontSize: 20,
                        color: ThemeConstants.light1Color,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // first textfield
                    InputFields(
                        controller: firstController,
                        icon: Icons.person,
                        hintText: 'First Name',
                        obscureText: false,
                        isPassword: false,
                        errorText:
                            _submitted || _validatefirst ? _firstError : null,
                        onChange: (_) => setState(() {
                              _validatefirst = true;
                            }),
                        textType: TextInputType.text),
                    const SizedBox(height: 20),
                    // last textfield
                    InputFields(
                        controller: lastController,
                        icon: Icons.person,
                        hintText: 'Last Name',
                        obscureText: false,
                        isPassword: false,
                        errorText:
                            _submitted || _validatelast ? _lastError : null,
                        onChange: (_) => setState(() {
                              _validatelast = true;
                            }),
                        textType: TextInputType.text),
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
                        textType: TextInputType.emailAddress),
                    const SizedBox(height: 20),
                    // phone textfield
                    NumberInput(
                      initialCountryCode: 'ZA',
                      onChange: (phone) => setState(() {
                        phoneController.text = phone.completeNumber;
                      }),
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
                    const SizedBox(height: 30),
                    ButtonWidget(
                      text: "Login",
                      press: () {
                        if (firstController.text.isEmpty &&
                          lastController.text.isEmpty && 
                          emailController.text.isEmpty &&
                          phoneController.text.isEmpty &&
                          passwordController.text.isEmpty) {
                          setState(() {
                            _submitted = true;
                          });
                        } else {
                          setState(() {
                            _submitted = false;
                            isApiCallProcessing = true; // Loader
                          });
                          _handleLogin(
                            firstController.text,
                            lastController.text,
                            emailController.text,
                            phoneController.text,
                            passwordController.text
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    // forgot password?
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: TextStyle(
                            color: ThemeConstants.light1Color.withOpacity(0.7),
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 16),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, login);
                          },
                          child: const Text('Sign In'),
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
      String firstController,
      String lastController,
      String emailController,
      String phoneController,
      String passwordController) async {
    registerRequestModel.firstname = firstController;
    registerRequestModel.lastname = lastController;
    registerRequestModel.email = emailController.toLowerCase();
    registerRequestModel.phone = phoneController;
    registerRequestModel.password = passwordController;

    //get response from ApiClient
    _apiClient.register(registerRequestModel).then((value) => {
      // ignore: unnecessary_null_comparison
      if (value != null){
        setState(() {
          isApiCallProcessing = false;
        }),
        if (value.message!.isNotEmpty){
          ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(value.message!))),
          Navigator.pushNamed(context, verifyOtp,
                      arguments: emailController)
        }else{
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
    return Row(mainAxisSize: MainAxisSize.min, children: [
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
              child: SvgPicture.asset(AssetConstants.googleImage)),
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
              child: SvgPicture.asset(AssetConstants.appleImage)),
        ),
      ),
    ]);
  }
}
