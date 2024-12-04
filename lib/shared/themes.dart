import 'package:flutter/material.dart';

ThemeData kLightMode = ThemeData(
  brightness: Brightness.light,
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Colors.black54,
    selectionColor: Colors.black,
    selectionHandleColor: Colors.green,
  ),
  colorScheme: const ColorScheme.light(
    primary: Color(0xfff3f3f3),
    onPrimary: Colors.black,
    inversePrimary: Colors.white,
    brightness: Brightness.light, // تأكد من تطابق brightness
  ),
);

ThemeData kDarkMode = ThemeData(
  brightness: Brightness.dark,
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Colors.white54,
    selectionColor: Colors.white,
    selectionHandleColor: Colors.green,
  ),
  colorScheme: const ColorScheme.dark(
    primary: Color(0xff1b1b1b),
    onPrimary: Colors.white,
    inversePrimary: Color(0xff2e2e2e),
    brightness: Brightness.dark, // تأكد من تطابق brightness
  ),
);
