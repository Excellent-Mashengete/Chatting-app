import 'package:chattingapp/common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SquareTitle extends StatelessWidget {
  const SquareTitle({
    Key? key,
    required this.imagePath,
    required this.onTap,
    required this.isImage,
  }) : super(key: key);

  final String imagePath;
  final bool isImage;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        width: 90,
        decoration: BoxDecoration(
          border: Border.all(color: ThemeConstants.dark2Color),
          borderRadius: BorderRadius.circular(16),
          color: ThemeConstants.dark2Color,
        ),
        child: isImage
          ? Image.asset(
              imagePath,
              height: 40,
              width: 100,
            )
          : SvgPicture.asset(
              imagePath,
              height: 40,
              width: 100,
            ),
      ),
    );
  }
}
