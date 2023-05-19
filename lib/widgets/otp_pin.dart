import 'package:chattingapp/common/common.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class OTPPin extends StatelessWidget {
  const OTPPin({
    Key? key,
    required this.controller,
    required this.hintText,
  }) : super(key: key);

  final TextEditingController? controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Form(
        child: SizedBox(
      height: 68,
      width: 64,
      child: TextFormField(
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          } else {
            FocusScope.of(context).previousFocus();
          }
        },
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          hintText: hintText,
          fillColor: ThemeConstants.dark2Color,
          enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: ThemeConstants.light1Color),
        ),
        focusColor: Colors.white,
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
