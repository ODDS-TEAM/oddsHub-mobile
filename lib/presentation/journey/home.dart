import 'package:flutter/material.dart';
import 'package:oddshub/presentation/journey/course/course_list_screen.dart';
import 'package:oddshub/presentation/widget/layout_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: const CourseListScreen(),
    );
  }
}
