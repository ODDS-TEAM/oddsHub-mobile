import 'package:flutter/material.dart';
import 'package:oddshub/config.dart';
import 'package:oddshub/presentation/journey/course/widget/course_card.dart';
import 'package:oddshub/data/models/course.dart';
import 'package:oddshub/presentation/journey/course/course_list_constants.dart';
import 'package:oddshub/routes.dart';
import 'package:oddshub/styles/colors.dart';

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
        children: isTrainer
            ? makeCourses(courses)
            : [
                ElevatedButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, Routes.sendEmail),
                  child: Text(
                    'Go to send email',
                    style: Theme.of(context).textTheme.button?.copyWith(
                          color: AppColors.primaryBackground,
                        ),
                  ),
                )
              ],
      ),
    );
  }

  List<Widget> makeCourses(List<Course> courses) {
    return [for (var course in courses) CourseCard(course: course)];
  }
}
