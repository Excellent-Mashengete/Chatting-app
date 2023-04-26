import 'package:chattingapp/constants.dart';
import 'package:chattingapp/widgets/Input_Textfield_widget.dart';
import 'package:chattingapp/widgets/button_widget.dart';
import 'package:chattingapp/routes.dart';
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

                const SizedBox(height: 80),

                // email textfield
                InputFields(
                  controller: emailController,
                  icon: Icons.email,
                  hintText: 'Email',
                  obscureText: false,
                ),

                const SizedBox(height: 20),

                // password textfield
                InputFields(
                  controller: passwordController,
                  icon:Icons.lock_rounded,
                  hintText: 'Password',
                  obscureText: true,
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
                const SizedBox(height: 100),
                ButtonWidget(
                  text: "Start Messaging",
                  press: () { 
                    Navigator.pushNamed(context, verifyOtp);
                  },
                ),
              ],
            )
          )
        ),
      )
    );
  }
}
