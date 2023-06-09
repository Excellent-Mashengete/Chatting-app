import 'package:chattingapp/common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class NumberInput extends StatelessWidget {
  const NumberInput({
    Key? key,
    required this.onChange,
    required this.initialCountryCode,
  }) : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  final onChange;
  final String initialCountryCode;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: IntlPhoneField(
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly,
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
          ],
          onChanged: onChange,
          initialCountryCode: initialCountryCode,
          decoration: const InputDecoration(
            filled: true,
            fillColor: ThemeConstants.dark2Color,
            prefixIconColor: ThemeConstants.light1Color,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ThemeConstants.light1Color),
            ),
            focusColor: Colors.white,
          ),
        ));
  }
}
