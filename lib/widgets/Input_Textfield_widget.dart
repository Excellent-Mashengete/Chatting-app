
import 'package:chattingapp/common/common.dart';
import 'package:flutter/material.dart';

class InputFields extends StatelessWidget {
  const InputFields({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.textType,
    required this.icon,
    required this.isPassword,
    this.changeVisibility,
    this.validator,
  }) : super(key: key);

  final TextEditingController? controller;
  final String hintText;
  final bool obscureText;
  final IconData icon;
  final bool isPassword;
  final VoidCallback? changeVisibility;
  final TextInputType textType;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      keyboardType: textType,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        hintText: hintText,
        fillColor: ThemeConstants.dark2Color,
        prefixIconColor: ThemeConstants.light1Color,
        suffixIcon: isPassword
            ? InkWell(
                onTap: changeVisibility,
                child:
                    Icon(obscureText ? Icons.visibility_off : Icons.visibility),
              )
            : null,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: ThemeConstants.light1Color),
        ),
        focusColor: Colors.white,
        prefixIcon: Icon(
          icon,
        ),
      ),
    );
  }
}
