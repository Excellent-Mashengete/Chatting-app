import 'package:chattingapp/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class EnterNewPassword extends StatefulWidget {
  const EnterNewPassword({super.key});
  
  @override
  State<EnterNewPassword> createState() => _EnterNewPasswordState();
}

class _EnterNewPasswordState extends State<EnterNewPassword> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWidget(title: 'New Password', icon: Icons.arrow_back),
      body: Center(
        child: Text('Password Reset Screen', style: TextStyle(fontSize: 40)),
      )
    );
  }
}
