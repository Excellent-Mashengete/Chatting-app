import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class OTPPin extends StatelessWidget {
  const OTPPin({
    Key? key,
    required this.controller,
    required this.hintText,
  }) : super(key: key);

  final controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: SizedBox(
      height: 68,
      width: 64,
      child: TextField(
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          } else {
            FocusScope.of(context).previousFocus();
          }
        },
        decoration: InputDecoration(
          hintText: hintText,
        ),

        style: Theme.of(context).textTheme.titleLarge,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
      ),
    ));
  }
}
