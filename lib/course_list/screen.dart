import 'package:flutter/material.dart';
import 'package:oddshub/config.dart';

import 'course_list_constants.dart';
import 'models/course.dart';
import 'widgets/course_card.dart';

class CourseListScreen extends StatelessWidget {
  static String path = '/course_list';
  final AppConfigs appConfigs;
  const CourseListScreen({super.key, required this.appConfigs});

  @override
  Widget build(BuildContext context) {
    final List<Course> courses = [
      CourseListConstants.clp,
      CourseListConstants.clp
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('ODDS')),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          return CourseCard(
            course: courses[index],
            isTrainer: appConfigs.isTrainer,
          );
        },
      ),
    );
  }
}
