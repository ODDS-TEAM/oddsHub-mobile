import 'package:flutter/material.dart';

class AppColors {
  static const int _primaryBase = 0xFF393944;
  static MaterialColor primaryColor = const MaterialColor(
    _primaryBase,
    <int, Color>{
      900: Color(0xFF0F0F14),
      800: Color(0xFF181820),
      700: Color(0xFF2C2C37),
      600: Color(0xFF2C2C37),
      500: Color(_primaryBase),
      400: Color(0xFF4A4A56),
      300: Color(0xFF5C5C68),
      200: Color(0xFF767682),
      100: Color(0xFF888894),
      50: Color(0xFFA0A0AB),
    },
  );
}
