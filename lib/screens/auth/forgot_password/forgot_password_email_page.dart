import 'package:chattingapp/constants.dart';
import 'package:chattingapp/widgets/Input_Textfield_widget.dart';
import 'package:chattingapp/widgets/app_bar_widget.dart';
import 'package:chattingapp/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});
  
  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const AppBarWidget(title: 'Forgot Password', icon: Icons.arrow_back),
      body: SafeArea(
        child: Center(
          child: Container(
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
                InputFields(
                  controller: emailController,
                  icon: Icons.email,
                  hintText: 'Email',
                  obscureText: false,
                ),

                //Forgot Password button
              
                const SizedBox(height: 100),
              
                ButtonWidget(
                  text: "REQUEST",
                  press: () { 
                    Navigator.pushNamed(context, enterNewPassword);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
