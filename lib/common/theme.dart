import 'package:flutter/material.dart';

class ThemeConstants {
  static const appBarHeight = 60.0;

  static const primaryColor = Color(0xFF5939AA);
  static const secondaryColor = Color(0xFF0D1A2E);

  static const dark1Color = Color(0xFF0D1A2E);
  static const dark2Color = Color(0xFF122646);
  static const light1Color = Color(0xFFF5F5F5);
  static const danger = Color.fromARGB(255, 255, 0, 0);
}

final dark = ThemeData(
  fontFamily: 'Montserrat',
  brightness: Brightness.dark,
  // ignore: deprecated_member_use
  backgroundColor: ThemeConstants.light1Color,
  primaryColor: ThemeConstants.dark1Color,
  scaffoldBackgroundColor: ThemeConstants.dark1Color,

  //APPBar Theme
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    titleTextStyle: TextStyle(
      fontSize: 18.0,
      color: Colors.white,
      decoration: TextDecoration.none,
    ),
  ),

  //Button
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      // ignore: deprecated_member_use
      primary: ThemeConstants.light1Color,
      // ignore: deprecated_member_use
      onSurface: ThemeConstants.light1Color,
      foregroundColor: ThemeConstants.dark1Color,
      minimumSize: const Size(double.infinity, 55),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      textStyle: const TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w500,
        fontSize: 18.0,
        decoration: TextDecoration.none,
      ),
    ),
  ),

  //Text Button
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
          // ignore: deprecated_member_use
          primary: ThemeConstants.light1Color,
          textStyle: const TextStyle(
              fontFamily: 'Montserrat', color: ThemeConstants.light1Color),),),

  //Input Text
  // inputDecorationTheme: const InputDecorationTheme(
  //     filled: true,
  //     fillColor: ThemeConstants.dark2Color,
  //     prefixIconColor: ThemeConstants.light1Color,
  //     enabledBorder: OutlineInputBorder(
  //       borderSide: BorderSide(color: Colors.transparent),
  //       borderRadius: BorderRadius.all(Radius.circular(15)),
  //     ),
  //     focusedBorder: OutlineInputBorder(
  //       borderRadius: BorderRadius.all(Radius.circular(15)),
  //       borderSide: BorderSide(color: ThemeConstants.light1Color),
  //     )),


);
