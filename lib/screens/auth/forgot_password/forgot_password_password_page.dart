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
                  children: const[
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
                  icon:Icons.lock_rounded,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(height: 30),
                
                // confirm new password textfield
                InputFields(
                  controller: confirmpasswordController,
                  icon:Icons.lock_rounded,
                  hintText: 'Password',
                  obscureText: true,
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
