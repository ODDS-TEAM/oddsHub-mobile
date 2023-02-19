import 'package:flutter/material.dart';
import 'package:oddshub/config.dart';
import 'package:oddshub/course_list/service.dart';
import 'package:oddshub/styles/colors.dart';
import 'package:oddshub/styles/text.dart';

import 'course.dart';
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
    CourseService.getCourses().then((value) {
      setState(() {
        courses = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ODDS')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Column(
            children: [
              Courses(
                label: 'Upcoming Classes',
                courses: courses,
                isTrainer: widget.appConfigs.isTrainer,
              ),
              const SizedBox(height: 24),
              Courses(
                label: 'Classes Category 1',
                courses: courses,
                isTrainer: widget.appConfigs.isTrainer,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Courses extends StatelessWidget {
  final String label;
  final List<Course> courses;
  final bool isTrainer;

  const Courses({
    super.key,
    required this.label,
    required this.courses,
    required this.isTrainer,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: CourseCard.height + 50,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label,
                  style: AppTextStyles.titleSmall.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
                Visibility(
                  visible: false,
                  child: Text(
                    'See All',
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.primaryColor.shade200,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: courses.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    if (index == 0) const SizedBox(width: 24),
                    CourseCard(
                      course: courses[index],
                      isTrainer: isTrainer,
                    ),
                    const SizedBox(width: 24),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
