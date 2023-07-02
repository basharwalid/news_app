
import 'package:flutter/material.dart';

class Mytheme{
  static const Color green = Color(0xff39A552);
  static const Color black = Color(0xff303030);

  ThemeData themeData = ThemeData(
    primaryColor: green,
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        fontSize: 20
      ),
      backgroundColor: green,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        )
      ),
        centerTitle: true
    ),
    textTheme: const TextTheme(
      titleSmall: TextStyle(
        fontSize: 14,
        color: Colors.white
      ),
      titleMedium: TextStyle(
        fontSize: 10,
        color: Color(0xff79828B),
      ),
      titleLarge: TextStyle(
        fontSize: 13,
        color: Color(0xffA3A3A3)
      ),
      headlineMedium: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
        color: Color(0xff303030)
      )
    )
  );
}