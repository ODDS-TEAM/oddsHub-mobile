import 'package:flutter/material.dart';
import 'package:oddshub/data/models/course.dart';
import 'package:oddshub/presentation/journey/course/course_list_constants.dart';
import 'package:oddshub/presentation/journey/course/widget/course_card.dart';

class CourseListScreen extends StatefulWidget {
  const CourseListScreen({Key? key}) : super(key: key);

  @override
  State<CourseListScreen> createState() => _CourseListScreenState();
}

class _CourseListScreenState extends State<CourseListScreen> {
  final List<Course> courses = [CourseListConstants.clp];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [for (var course in courses) CourseCard(course: course)],
      ),
    );
  }
}
