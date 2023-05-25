import 'package:chattingapp/common/common.dart';
import 'package:chattingapp/constants.dart';
import 'package:chattingapp/service/auth_api_service.dart';
import 'package:chattingapp/widgets/widgets.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final ApiClient _apiClient = ApiClient();
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool _absecure = true;
  bool isApiCallProcessing = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 50),
                      const Icon(Icons.lock, size: 100),
                      const SizedBox(height: 50),

                      Text(
                        'Welcome back you\'ve been missed!',
                        style: TextStyle(
                          color: ThemeConstants.light1Color.withOpacity(0.7),
                          fontSize: 16,
                        ),
                      ),

                      const SizedBox(height: 25),
                      InputFields(
                        controller: usernameController,
                        hintText: 'Username',
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

                      // forgot password?
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, forgotpassword);
                              },
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                    color: ThemeConstants.light1Color
                                        .withOpacity(0.7)),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 35),

                      // // sign in button
                      ButtonWidget(
                        text: "Login",
                        press: () {
                          final valid = _formKey.currentState!.validate();
                          if (valid) {
                           setState(() {
                              isApiCallProcessing = true;
                            });
                            _apiClient.logInWithEmailAndPassword(context, 
                              usernameController.text, passwordController.text
                            );
                            setState(() {
                              isApiCallProcessing = false;
                            });

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
                            onTap: () {
                              _apiClient.logInWithGoogle(context);
                            },
                            isImage: false,
                          ),

                          const SizedBox(width: 25),

                          // apple button
                          SquareTitle(
                            imagePath: AssetConstants.appleImage,
                            onTap: () {},
                            isImage: false,
                          ),

                          const SizedBox(width: 25),

                          // Huawei button
                          SquareTitle(
                            imagePath: AssetConstants.huaweiImage,
                            onTap: () {},
                            isImage: true,
                          ),
                        ],
                      ),

                      const SizedBox(height: 50),

                      // not a member? register now
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Not a member?',
                            style: TextStyle(
                                color: ThemeConstants.light1Color
                                    .withOpacity(0.7)),
                          ),
                          const SizedBox(width: 4),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, register);
                            },
                            child: const Text(
                              'Register now',
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


}
