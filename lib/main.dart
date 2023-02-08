import 'package:flutter/material.dart';
import 'package:oddshub/colors.dart';
import 'package:oddshub/home.dart';
import 'package:oddshub/presentation/journey/Registration/registration_success_screen.dart';
import 'package:oddshub/presentation/journey/registration/registration_screen.dart';
import 'package:oddshub/send_email.dart';

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
        primarySwatch: AppColors.primaryMaterialColor,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: AppColors.primaryButton,
          ),
        ),
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomePage(),
        '/registration': (context) => const RegistrationScreen(),
        '/registration_success': (context) => const RegistrationSuccessScreen(),
        '/send_email': (context) => const SendEmailPage(),
      },
    );
  }
}
