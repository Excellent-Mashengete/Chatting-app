import 'package:chattingapp/common/common.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';

class ReplyCard extends StatelessWidget {
  const ReplyCard({
    Key? key, 
    this.message, 
    this.time
  }) : super(key: key);
  final String? message;
  final String? time;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 80),
        child: ClipPath(
          clipper: LowerNipMessageClipper(MessageType.send),
          child: Stack(
            children:[ 
              Container(
                padding: const EdgeInsets.only(left: 20, top: 10, bottom: 30, right: 75),
                decoration: BoxDecoration(
                  color: ThemeConstants.primaryColor, 
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    )
                  ],
                ),
                child: Text(
                message!,
                textAlign: TextAlign.start,
                  style: const TextStyle(  
                    color: ThemeConstants.light1Color, fontSize: 16
                  ),
                ),
              ),
              Positioned(
                bottom: 9,
                right: 30,
                child: Row(
                  children: [
                    Text(
                      time!,
                      style: const TextStyle(
                        fontSize: 13,
                        color: ThemeConstants.light1Color,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(
                      Icons.done_all,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ], 
          ),
        ),
      ),
    );
  }
}
