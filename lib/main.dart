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
        fontFamily: 'NotoSans',
        textTheme: TextTheme(
          displayLarge: TextStyle(
            color: AppColors.primaryButton,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          displayMedium: TextStyle(
            color: AppColors.primaryButton,
            fontSize: 24,
            fontWeight: FontWeight.normal,
          ),
          titleMedium: TextStyle(
            color: AppColors.primaryButton,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
          bodyLarge: TextStyle(
            color: AppColors.primaryButton,
            fontSize: 24,
            fontWeight: FontWeight.normal,
          ),
          bodyMedium: TextStyle(
            color: AppColors.primaryButton,
            fontSize: 24,
            fontWeight: FontWeight.normal,
          ),
          labelLarge: TextStyle(
            color: AppColors.secondaryButton,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        primarySwatch: AppColors.primaryMaterialColor,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryButton,
            foregroundColor: AppColors.primaryBackground,
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
