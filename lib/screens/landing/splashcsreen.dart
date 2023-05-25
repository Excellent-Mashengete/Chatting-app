import 'package:chattingapp/common/common.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);

 @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ThemeConstants.dark1Color
      ),
      child: AnimatedOpacity(
        opacity: 1, 
        duration: const Duration(
          microseconds: 1200
        ),
        child: Center(
          child: ClipOval(
            clipBehavior: Clip.none,
            child: Image.asset(AssetConstants.loggo,
              height: 200,
              width: 200,
            ),
          ),
        ),
      ),
    );
  }
}
