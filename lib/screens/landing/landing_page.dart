import 'package:chattingapp/constants.dart';
import 'package:chattingapp/widgets/button_widget.dart';
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
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 150),
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/images/chat.png',
                        fit: BoxFit.cover,
                        height: 210,
                        width: 210,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Welcome to Chatting App, Fast and Secure', 
                      style: TextStyle(fontSize: 18,),
                    )
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(height: 100),
                    ButtonWidget(
                      text: "Start Messaging",
                      press: () { 
                        Navigator.pushNamed(context, login);
                      },
                    ),
                  ]
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
