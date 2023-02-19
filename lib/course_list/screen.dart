import 'package:flutter/material.dart';
import 'package:oddshub/config.dart';
import 'package:oddshub/course_list/service.dart';
import 'package:oddshub/course_list/widgets/detail.dart';
import 'package:oddshub/styles/colors.dart';
import 'package:oddshub/styles/constant.dart';
import 'package:oddshub/styles/text.dart';

import 'model.dart';
import 'widgets/course_card.dart';

class CourseListScreen extends StatefulWidget {
  static String path = '/course_list';
  final AppConfigs appConfigs;
  const CourseListScreen({super.key, required this.appConfigs});

  @override
  State<CourseListScreen> createState() => _CourseListScreenState();
}

class _CourseListScreenState extends State<CourseListScreen> {
  List<Course> classes = [];
  List<Course> courses = [];
  @override
  void initState() {
    CourseService.getCourses().then((value) {
      setState(() {
        classes = value;
        courses = [...value, ...value];
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ODDS'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Classes'),
              Tab(text: 'Courses'),
            ],
          ),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            BaseTabView(
              type: 'Classes',
              datas: classes,
              widget: widget,
              detailPath: ClassDetailScreen.path,
            ),
            BaseTabView(
              type: 'Courses',
              datas: courses,
              widget: widget,
              detailPath: CourseDetailScreen.path,
            ),
          ],
        ),
      ),
    );
  }
}

class BaseTabView extends StatelessWidget {
  final String type;
  final String detailPath;
  final List<Course> datas;
  final CourseListScreen widget;

  const BaseTabView({
    super.key,
    required this.type,
    required this.datas,
    required this.widget,
    required this.detailPath,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: kSpaceBetweenItem),
        child: Column(
          children: [
            Courses(
              label: 'Upcoming $type',
              courses: datas,
              isTrainer: widget.appConfigs.isTrainer,
              detailPath: detailPath,
            ),
            const SizedBox(height: kSpaceBetweenItem),
            Courses(
              label: '$type Category 1',
              courses: datas,
              isTrainer: widget.appConfigs.isTrainer,
              detailPath: detailPath,
            ),
          ],
        ),
      ),
    );
  }
}

class Courses extends StatelessWidget {
  final String label;
  final List<Course> courses;
  final bool isTrainer;
  final String detailPath;

  const Courses({
    super.key,
    required this.label,
    required this.courses,
    required this.isTrainer,
    required this.detailPath,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: CourseCard.height + 50,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: kSpaceBetweenItem),
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
          const SizedBox(height: kSpaceBetweenText),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: courses.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed(
                    detailPath,
                    arguments: courses[index],
                  ),
                  child: Row(
                    children: [
                      if (index == 0) const SizedBox(width: kSpaceBetweenItem),
                      CourseCard(
                        course: courses[index],
                        isTrainer: isTrainer,
                      ),
                      const SizedBox(width: kSpaceBetweenItem),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
