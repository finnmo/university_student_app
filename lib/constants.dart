import 'package:flutter/material.dart';

const colourPrimary = Color(0xFFdeb343);

ColorScheme lightThemeColors(context) {
  return const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFFdeb343),
    onPrimary: Color(0xFF505050),
    secondary: Color(0xff8b8b8d),
    onSecondary: Color(0xfffafafc),
    error: Color(0xFFF32424),
    onError: Color(0xFFF32424),
    background: Color(0xfff2f1f6),
    onBackground: Color(0xffe1e1e1),
    surface: Color(0xfffcfcfe),
    onSurface: Color.fromARGB(255, 0, 0, 0),
  );
}