import 'package:chattingapp/common/common.dart';
import 'package:chattingapp/constants.dart';
import 'package:chattingapp/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  
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
                Image.asset(AssetConstants.loggo,
                  fit: BoxFit.cover,
                  height: 210,
                  width: 210,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Welcome to Chatting App, Fast and Secure',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 100),
                ButtonWidget(
                  text: "Start Messaging",
                  press: () {
                    Navigator.pushNamed(context, login);
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
