import 'package:chattingapp/common/common.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';

class Incomming extends StatelessWidget {
  const Incomming({Key? key, this.message, this.time}) : super(key: key);
  final String? message;
  final String? time;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(right: 80, left: 10, top: 10),
        child: ClipPath(clipper: UpperNipMessageClipper(MessageType.receive),
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 30, top: 20, bottom: 20, right: 60),
                decoration: BoxDecoration(
                  color: ThemeConstants.dark2Color, 
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(3, 3),
                    ),
                  ],
                ),
                child: Text(
                  message!,
                  style: const TextStyle(
                    color: ThemeConstants.light1Color, 
                    fontSize: 16
                  ),          
                ),
              ),
              Positioned(
                bottom: 9,
                right: 15,
                child: Text(
                  time!,
                  style: const TextStyle(
                    fontSize: 13,
                    color: ThemeConstants.light1Color,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
