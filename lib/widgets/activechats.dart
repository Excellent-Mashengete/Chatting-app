import 'package:chattingapp/common/theme.dart';
import 'package:flutter/material.dart';

class ActiveChats extends StatelessWidget {
  const ActiveChats({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 5),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (int i = 0; i <10; i++)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                child: Container(
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                    color: ThemeConstants.light1Color,
                    borderRadius: BorderRadius.circular(35),
                    boxShadow: [
                      BoxShadow(
                        color: ThemeConstants.dark2Color.withOpacity(0.5),
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: const Offset(0,3)
                      )
                    ]
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: Image.network('https://avatarfiles.alphacoders.com/975/97500.jpg'),
                  ),
                ),
              ),
      
          ],
        ),
      ),
    );
  }
}