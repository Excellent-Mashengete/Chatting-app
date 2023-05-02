import 'package:chattingapp/constants.dart';
import 'package:chattingapp/widgets/Input_Textfield_widget.dart';
import 'package:chattingapp/widgets/app_bar_widget.dart';
import 'package:chattingapp/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class EnterNewPassword extends StatefulWidget {
  const EnterNewPassword({super.key});

  @override
  State<EnterNewPassword> createState() => _EnterNewPasswordState();
}

class _EnterNewPasswordState extends State<EnterNewPassword> {
  final newpasswordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  var _obscureText = true;
  var _confirmobscureText = true;
  bool _submitted = false;
  bool _validatePass = false;
  bool _validateConfPass = false;

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
      appBar: const AppBarWidget(title: 'New Password', icon: Icons.arrow_back),
      body: SafeArea(
        child: Center(
          child: Container(
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
                  errorText: _submitted || _validatePass ? _passwordError : null,
                  isPassword: true,
                  onChange:(_) => setState(() {
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
                  errorText: _submitted || _validateConfPass ? _confirmpasswordError  : null,
                  isPassword: true,
                   onChange:(_) => setState(() {
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
                    Navigator.pushNamed(context, homepage);
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
