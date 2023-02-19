import 'dart:io';

import 'package:flutter/material.dart';
import 'package:oddshub/config.dart';
import 'package:oddshub/data/datasources/remote/my_client.dart';
import 'package:oddshub/registration/screen.dart';
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
      },
    );
  }
}
