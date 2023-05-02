import 'dart:ffi';

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
  final onChange;

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


/*
 return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: TextField(
        obscureText: abscure, //dynamic data
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.grey),
          filled: true,
          fillColor: const Color(0xFFF5F5F5),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFF5F5F5), width: 1),
            borderRadius: BorderRadius.all(Radius.circular(15))
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: Color(0xFF000000), width: 1)
          ),
          hintText: text //dynamic data
        ),
      ),
    );


     controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        errorText: errorText,
        prefixIcon: Icon(icon),
        hintText: hintText,
        suffixIcon: isPassword
          ? IconButton(
              padding: const EdgeInsetsDirectional.only(end: 12.0),
              onPressed: changeVisibility,
              icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
            )
          : null
      ),
    */