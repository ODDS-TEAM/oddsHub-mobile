import 'package:flutter/material.dart';
import 'package:oddshub/colors.dart';
import 'package:oddshub/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "NotoSans",
        textTheme: TextTheme(
          headline1: TextStyle(
            color: AppColors.primaryButton,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          headline2: TextStyle(
            color: AppColors.primaryButton,
            fontSize: 24,
            fontWeight: FontWeight.normal,
          ),
          subtitle1: TextStyle(
            color: AppColors.primaryButton,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
          bodyText1: TextStyle(
            color: AppColors.primaryButton,
            fontSize: 24,
            fontWeight: FontWeight.normal,
          ),
          bodyText2: TextStyle(
            color: AppColors.primaryButton,
            fontSize: 24,
            fontWeight: FontWeight.normal,
          ),
          button: TextStyle(
            color: AppColors.secondaryButton,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}
