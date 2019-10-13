import 'package:flutter/material.dart';

class AppTheme {
  ThemeData themeData() {
    return ThemeData(
      scaffoldBackgroundColor: const Color(0xFFF3E5F5),
      // backgroundColor: const Color(0xFFF3E5F5),
      primaryColor: const Color(0xffBA6BCB),
      accentColor: const Color(0xffD1C4E9),
      textTheme: _textTheme(),
    );
  }

  TextTheme _textTheme() {
    return TextTheme(
      title: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
    );
  }
}
