import 'package:flutter/material.dart';
import 'package:oddshub/config.dart';
import 'package:oddshub/course_list/service.dart';

import 'models/course.dart';
import 'widgets/course_card.dart';

class CourseListScreen extends StatefulWidget {
  static String path = '/course_list';
  final AppConfigs appConfigs;
  const CourseListScreen({super.key, required this.appConfigs});

  @override
  State<CourseListScreen> createState() => _CourseListScreenState();
}

class _CourseListScreenState extends State<CourseListScreen> {
  List<Course> courses = [];
  @override
  void initState() {
    super.initState();
    CourseService.getCourses().then((value) {
      setState(() {
        courses = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ODDS')),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          return CourseCard(
            course: courses[index],
            isTrainer: widget.appConfigs.isTrainer,
          );
        },
      ),
    );
  }
}
