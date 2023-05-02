import 'package:chattingapp/constants.dart';
import 'package:chattingapp/widgets/Input_Textfield_widget.dart';
import 'package:chattingapp/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var _obscureText = true;
  bool _submitted = false;
  bool _validateEmail = false;
  bool _validatePass = false;

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
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.lock, size: 100),
                const SizedBox(height: 70),

                // email textfield
                InputFields(
                  controller: emailController,
                  icon: Icons.email,
                  hintText: 'Email',
                  obscureText: false,
                  isPassword: false,
                  errorText: _submitted || _validateEmail ? _emailError : null,
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
                  errorText: _submitted || _validatePass ? _passwordError : null,
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

                const SizedBox(height: 10),

                // forgot password?
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, forgotpassword);
                      },
                      child: const Text('Forgot Password?'),
                    ),
                  ],
                ),

                // sign in button
                const SizedBox(height: 70),
                ButtonWidget(
                  text: "Login",
                  press: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




/*
Navigator.pushNamed(context, verifyOtp)
 */