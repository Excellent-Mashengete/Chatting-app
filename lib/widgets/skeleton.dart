import 'package:chattingapp/common/common.dart';
import 'package:flutter/material.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({
    Key? key,
    this.height,
    this.width,
  }) : super(key: key);

  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            height: height,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: ThemeConstants.light1Color.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
}
