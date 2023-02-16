import 'dart:io';

import 'package:flutter/material.dart';
import 'package:oddshub/config.dart';
import 'package:oddshub/data/datasources/remote/my_client.dart';
import 'package:oddshub/presentation/journey/home.dart';
import 'package:oddshub/presentation/journey/registration/individual_payment/individual_payment_screen.dart';
import 'package:oddshub/presentation/journey/send_email/send_email_bloc.dart';
import 'package:oddshub/presentation/journey/send_email/send_email_fail_screen.dart';
import 'package:oddshub/presentation/journey/send_email/send_email_screen.dart';
import 'package:oddshub/presentation/journey/send_email/send_email_success_screen.dart';
import 'package:oddshub/registration/screen.dart';
import 'package:oddshub/routes.dart';
import 'package:oddshub/styles/app_textstyles.dart';
import 'package:oddshub/styles/colors.dart';

import 'course_list/screen.dart';

void main() {
  MyClient.httpClient = HttpClient();
  runApp(
    MyApp(
      appConfigs: AppConfigs(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AppConfigs appConfigs;
  const MyApp({Key? key, required this.appConfigs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'NotoSans',
        textTheme: TextTheme(
          displayLarge: AppTextStyles.displayLarge,
          displayMedium: AppTextStyles.displayMedium,
          displaySmall: AppTextStyles.displaySmall,
          titleMedium: AppTextStyles.titleMedium,
          bodyLarge: AppTextStyles.bodyLarge,
          bodyMedium: AppTextStyles.bodyMedium,
          labelLarge: AppTextStyles.labelLarge,
        ),
        primarySwatch: AppColors.primaryMaterialColor,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryButton,
          ),
        ),
      ),
      initialRoute: CourseListScreen.path,
      routes: {
        CourseListScreen.path: (context) =>
            CourseListScreen(appConfigs: appConfigs),
        RegistrationScreen.path: (context) =>
            RegistrationScreen(appConfigs: appConfigs),
        Routes.home: (context) => HomePage(appConfigs: appConfigs),
        Routes.individualPayment: (context) => IndividualPaymentScreen(
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
