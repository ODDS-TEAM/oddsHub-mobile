import 'dart:io';

import 'package:flutter/material.dart';
import 'package:oddshub/styles/app_textstyles.dart';
import 'package:oddshub/styles/colors.dart';
import 'package:oddshub/data/datasources/remote/my_client.dart';
import 'package:oddshub/presentation/journey/home.dart';
import 'package:oddshub/presentation/journey/registration/registration_success/registration_success_screen.dart';
import 'package:oddshub/presentation/journey/registration/registration_screen.dart';
import 'package:oddshub/presentation/journey/send_email/send_email_bloc.dart';
import 'package:oddshub/presentation/journey/send_email/send_email_fail_screen.dart';
import 'package:oddshub/presentation/journey/send_email/send_email_success_screen.dart';
import 'package:oddshub/routes.dart';
import 'package:oddshub/presentation/journey/send_email/send_email_screen.dart';

void main() {
  MyClient.httpClient = HttpClient();
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
          headline1: AppTextStyles.headline1,
          headline2: AppTextStyles.headline2,
          subtitle1: AppTextStyles.subtitle1,
          bodyText1: AppTextStyles.bodyText1,
          bodyText2: AppTextStyles.bodyText2,
          button: AppTextStyles.button,
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
        Routes.registration: (context) => RegistrationScreen(
              onTapDiscardButton: () {
                Navigator.pushNamed(context, Routes.home);
              },
            ),
        Routes.registrationSuccess: (context) => RegistrationSuccessScreen(
              okButtonDidTap: () {
                Navigator.popUntil(
                  context,
                  ModalRoute.withName(Routes.home),
                );
              },
            ),
        Routes.sendEmail: (context) => SendEmailScreen(
              sendEmailBloc: SendEmailBloc(),
              navSuccess: () =>
                  Navigator.pushNamed(context, Routes.sendEmailSuccess),
              navFail: () => Navigator.pushNamed(context, Routes.sendEmailFail),
            ),
        Routes.sendEmailSuccess: (context) => const SendMailSuccessScreen(),
        Routes.sendEmailFail: (context) => const SendMailFailScreen(),
      },
    );
  }
}
