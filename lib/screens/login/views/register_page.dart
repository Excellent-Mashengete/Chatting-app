import 'package:chattingapp/common/common.dart';
import 'package:chattingapp/constants.dart';
import 'package:chattingapp/model/models.dart';
import 'package:chattingapp/service/auth_api_service.dart';
import 'package:chattingapp/widgets/widgets.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final ApiClient _apiClient = ApiClient();
  late RegisterRequestModel registerRequestModel;

  final _formKey = GlobalKey<FormState>();
  final firstController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  bool _absecure = true;
  bool isApiCallProcessing = false;

  @override
  void initState() {
    super.initState();
    registerRequestModel = RegisterRequestModel();
  }

  @override
  void dispose() {
    phoneController.dispose();
    firstController.dispose();
    emailController.dispose();
    passwordController.dispose();
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
      backgroundColor: ThemeConstants.dark1Color,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              children: [
                Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),
                      const Icon(Icons.lock, size: 50),
                      const SizedBox(height: 40),

                      Text(
                        'Lets create an account for you!',
                        style: TextStyle(
                          color: ThemeConstants.light1Color.withOpacity(0.7),
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 25),
                      InputFields(
                        controller: firstController,
                        hintText: 'Name',
                        icon: Icons.person,
                        textType: TextInputType.text,
                        obscureText: false,
                        isPassword: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter your name';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 30),
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

                      const SizedBox(height: 30),

                      InputFields(
                        controller: passwordController,
                        hintText: 'Password',
                        icon: Icons.lock_rounded,
                        textType: TextInputType.visiblePassword,
                        obscureText: _absecure,
                        isPassword: true,
                        changeVisibility: () {
                          setState(() {
                            _absecure = !_absecure;
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
                      const SizedBox(height: 20),
                      NumberInput(
                        initialCountryCode: 'ZA',
                        onChange: (phone) => setState(
                          () {
                            phoneController.text = phone.completeNumber;
                          },
                        ),
                      ),

                      const SizedBox(height: 35),

                      // // sign in button
                      ButtonWidget(
                        text: "Register",
                        press: () {
                          final valid = _formKey.currentState!.validate();
                          if (valid) {
                            setState(() {
                               isApiCallProcessing = true;
                            });
                            _handleRegister();
                          }
                        },
                      ),

                      const SizedBox(height: 30),

                      // or continue with
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                thickness: 0.5,
                                color:
                                    ThemeConstants.light1Color.withOpacity(0.7),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text(
                                'Or continue with',
                                style: TextStyle(
                                    color: ThemeConstants.light1Color
                                        .withOpacity(0.7)),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                thickness: 0.5,
                                color:
                                    ThemeConstants.light1Color.withOpacity(0.7),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 30),

                      // google + apple sign in buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // google button
                          SquareTitle(
                              imagePath: AssetConstants.googleImage,
                              onTap: () {}),

                          const SizedBox(width: 25),

                          // apple button
                          SquareTitle(
                              imagePath: AssetConstants.appleImage,
                              onTap: () {})
                        ],
                      ),

                      const SizedBox(height: 30),

                      // not a member? register now
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            style: TextStyle(
                                color: ThemeConstants.light1Color
                                    .withOpacity(0.7)),
                          ),
                          const SizedBox(width: 4),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, login);
                            },
                            child: const Text(
                              'Login now',
                              style: TextStyle(
                                color: ThemeConstants.light1Color,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
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
      ),
    );
  }

  Future<void> _handleRegister() async {
    registerRequestModel.name = firstController.text;
    registerRequestModel.email = emailController.text.toLowerCase();
    registerRequestModel.password = passwordController.text;
    registerRequestModel.phone = phoneController.text;
    _apiClient.register(registerRequestModel).then((value) => {
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
                  Navigator.pushNamed(context, verifyOtp,
                    arguments: emailController.text.toLowerCase()),
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
