import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';

class ChatSample extends StatelessWidget {
  const ChatSample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Left Message
        Padding(
          padding: const EdgeInsets.only(right: 80),
          child: ClipPath(
            clipper: UpperNipMessageClipper(MessageType.receive),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration:
                  BoxDecoration(color: const Color(0xFFE1E1E2), boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: const Offset(3, 3),
                )
              ]),
              child: const Text(
                "Hi, developers How are you",
                style: TextStyle(color: Color(0xFF0D1A2E), fontSize: 16),
              ),
            ),
          ),
        ),

        //Right Message
        Container(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 80),
            child: ClipPath(
              clipper: LowerNipMessageClipper(MessageType.send),
              child: Container(
                padding: const EdgeInsets.only(
                    left: 20, top: 10, bottom: 25, right: 20),
                decoration:
                    BoxDecoration(color: const Color(0xFF122646), boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  )
                ]),
                child: const Text(
                  "Hello Programmer, I am fine thanks for asking what about you. I hope you are fine yourself ",
                  style: TextStyle(color: Color(0xFFF5F5F5), fontSize: 16),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
