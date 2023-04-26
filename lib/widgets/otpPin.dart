import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OTPPin extends StatelessWidget {
  const OTPPin({Key? key}) : super(key: key);

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
        decoration: const InputDecoration(
          hintText: "0",
          filled: true,
          fillColor: Color(0xFFF5F5F5),
          enabledBorder:  OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFF5F5F5), width: 1),
            borderRadius: BorderRadius.all(Radius.circular(15))
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: Color(0xFF000000), width: 1)
          ),
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
