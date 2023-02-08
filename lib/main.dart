import 'package:flutter/material.dart';
import 'package:oddshub/colors.dart';
import 'package:oddshub/presentation/journey/home.dart';
import 'package:oddshub/presentation/journey/registration/registration_success_screen.dart';
import 'package:oddshub/presentation/journey/registration/registration_screen.dart';
import 'package:oddshub/routes.dart';
import 'package:oddshub/presentation/journey/send_email/send_email_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
      initialRoute: Routes.home,
      routes: {
        Routes.home: (context) => const HomePage(),
        Routes.registration: (context) => const RegistrationScreen(),
        Routes.registrationSuccess: (context) => RegistrationSuccessScreen(
              okButtonDidTap: () {
                Navigator.popUntil(
                  context,
                  ModalRoute.withName(Routes.home),
                );
              },
            ),
        Routes.sendEmail: (context) => const SendEmailScreen(),
      },
    );
  }
}
