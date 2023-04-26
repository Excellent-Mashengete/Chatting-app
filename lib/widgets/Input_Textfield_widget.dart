import 'package:flutter/material.dart';

class InputFields extends StatelessWidget {
  const InputFields({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.icon,
   
  }) : super(key: key);

  final controller;
  final String hintText;
  final bool obscureText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          
          prefixIcon: Icon(icon),
          hintText: hintText,
        ),
      ),
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
    */