
import 'package:flutter/material.dart';

class InputFields extends StatelessWidget {
  const InputFields({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.icon,
    required this.isPassword,
    required this.errorText,
    required this.textType,
    required this.onChange,
    this.changeVisibility,
  }) : super(key: key);

  final TextEditingController? controller;
  final String hintText;
  final bool obscureText;
  final IconData icon;
  final bool isPassword;
  final VoidCallback? changeVisibility;
  final String? errorText;
  final TextInputType textType;
  final onChange ;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: textType,
      onChanged: onChange,
      decoration: InputDecoration(
          errorText: errorText,
          prefixIcon: Icon(icon),
          hintText: hintText,
          suffixIcon: isPassword
              ? IconButton(
                  padding: const EdgeInsetsDirectional.only(end: 12.0),
                  onPressed: changeVisibility,
                  icon: Icon(
                      obscureText ? Icons.visibility_off : Icons.visibility),
                )
              : null),
    );
  }
}