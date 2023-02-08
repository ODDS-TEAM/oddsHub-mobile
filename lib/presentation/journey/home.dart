import 'package:flutter/material.dart';
import 'package:oddshub/presentation/journey/course/course_list_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('OddsHub'),
      ),
      body: const CourseListScreen(),
    );
  }
}
