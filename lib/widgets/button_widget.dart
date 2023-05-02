import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
    required this.text,
    this.press,
    this.border,
  }) : super(key: key);

  final String text;
  final VoidCallback? press;
  final Border? border;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: press,
      child: Text(text),
    );
  }
}