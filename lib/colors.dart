import 'package:flutter/material.dart';

class AppColors {
  static Color primary = const Color(0xff393944);
  static Color primaryButton = const Color(0xff393944);
  static Color secondaryButton = const Color(0xffc0bcbc);

  static Color primaryBackground = const Color(0xffffffff);
  static Color secondaryBackground = const Color(0xffe3e3e3);

  static Color green = const Color(0xff268b08);

  static MaterialColor primaryMaterialColor = const MaterialColor(
    0xff393944,
    <int, Color>{
      50: Color.fromRGBO(57, 57, 68, .1),
      100: Color.fromRGBO(57, 57, 68, .2),
      200: Color.fromRGBO(57, 57, 68, .3),
      300: Color.fromRGBO(57, 57, 68, .4),
      400: Color.fromRGBO(57, 57, 68, .5),
      500: Color.fromRGBO(57, 57, 68, .6),
      600: Color.fromRGBO(57, 57, 68, .7),
      700: Color.fromRGBO(57, 57, 68, .8),
      800: Color.fromRGBO(57, 57, 68, .9),
      900: Color.fromRGBO(57, 57, 68, 1),
    },
  );
}
