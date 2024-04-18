import 'package:flutter/material.dart';

class AppThemeManager{
  static const primaryColor = Color(0xff39A552);
static ThemeData lightTheme=ThemeData(
  primaryColor: primaryColor,
  scaffoldBackgroundColor: Colors.transparent,
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(
      color: Colors.white,
      size: 35
    ),
    backgroundColor: primaryColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(35),
        bottomRight: Radius.circular(35),
      ),
    ),
centerTitle: true,
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontFamily: "Exo",
      fontWeight: FontWeight.w600,
      color: Colors.white,
      fontSize: 22,
    ),
    bodyLarge: TextStyle(
      fontFamily: "Exo",
      fontWeight: FontWeight.w700,
      color: Colors.black,
      fontSize: 22,
    ),
    bodyMedium: TextStyle(
      fontFamily: "Exo",
      fontWeight: FontWeight.w500,
      color: Colors.black,
      fontSize: 18,
  ),
  bodySmall: TextStyle(
  fontFamily: "Exo",
  fontWeight: FontWeight.w400,
  color: Colors.white,
  fontSize: 18,
  ),
  )
);
}