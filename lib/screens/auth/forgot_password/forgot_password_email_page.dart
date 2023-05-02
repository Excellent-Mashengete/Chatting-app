import 'package:chattingapp/constants.dart';
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
  bool _validateEmail = false;
  bool _submitted = false;

  String? get _forgotpassError {
    final text = emailController.value.text;

    if (text.isEmpty) {
      return 'Enter valid email address or phone number';
    }

    // return null if the text is valid
    return null;
  }

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
                TextField(
                  controller: emailController,
                  obscureText: false,
                  keyboardType: TextInputType.text,
                  onChanged: (_) => setState(() {
                     _validateEmail = true;
                  }),
                  decoration: InputDecoration(
                    hintText: 'Email / Phone Number',
                    errorText: _submitted || _validateEmail ? _forgotpassError : null,
                  ),
                ),

                //Forgot Password button
              
                const SizedBox(height: 100),
              
                ButtonWidget(
                  text: "REQUEST",
                  press: () { 
                    Navigator.pushNamed(context, verifyforgotPassword);
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
