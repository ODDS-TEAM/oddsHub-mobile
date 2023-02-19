import 'package:flutter/material.dart';
import 'package:oddshub/config.dart';
import 'package:oddshub/registration/screen.dart';
import 'package:oddshub/styles/colors.dart';

import 'course_list/screen.dart';

void main() {
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
        primarySwatch: AppColors.primaryColor,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
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
