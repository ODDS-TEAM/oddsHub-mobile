import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:oddshub/course_list/model.dart';
import 'package:oddshub/styles/colors.dart';
import 'package:oddshub/styles/constant.dart';
import 'package:oddshub/styles/text.dart';

import 'course_image.dart';

class ClassDetailScreen extends BaseDetailScreen {
  static const String path = '/class-detail';
  const ClassDetailScreen({super.key})
      : super(
          title: 'Class Detail',
          actionLabel: 'Register',
        );

  @override
  void onAction() {
    log(
      'Class Action',
      name: 'Debug Log',
    );
  }
}

class CourseDetailScreen extends BaseDetailScreen {
  static const String path = '/course-detail';
  const CourseDetailScreen({super.key})
      : super(
          title: 'Course Detail',
          actionLabel: 'Add Waiting List',
        );

  @override
  void onAction() {
    log(
      'Course Action',
      name: 'Debug Log',
    );
  }
}

class BaseDetailScreen extends StatelessWidget {
  final String title;
  final double spaceBetween;
  final String actionLabel;
  const BaseDetailScreen({
    super.key,
    required this.title,
    required this.actionLabel,
    this.spaceBetween = 8,
  });

  @override
  Widget build(BuildContext context) {
    final Course course = ModalRoute.of(context)?.settings.arguments as Course;
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Container(
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom,
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CourseImage(course: course, withBorderRadius: false),
                    const SizedBox(height: kSpaceBetweenItem / 2),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: kSpaceBetweenItem,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  course.name,
                                  style: AppTextStyles.titleLarge,
                                ),
                              ),
                              const SizedBox(width: kSpaceBetweenText),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.share, size: 24),
                              ),
                            ],
                          ),
                          SizedBox(height: spaceBetween),
                          Text(
                            course.instructor,
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.primaryColor.shade200,
                            ),
                          ),
                          SizedBox(height: spaceBetween),
                          Row(
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.watch_later_outlined),
                                  SizedBox(width: spaceBetween),
                                  Text(course.formattedDate),
                                ],
                              ),
                              const SizedBox(width: kSpaceBetweenItem),
                              Row(
                                children: [
                                  const Icon(Icons.people),
                                  SizedBox(width: spaceBetween),
                                  Text(course.remainderPeople),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: kSpaceBetweenItem),
                          Text(
                            course.description,
                            style: AppTextStyles.bodyLarge,
                          ),
                          const SizedBox(height: kSpaceBetweenItem),
                          _buildActionButton(course, spaceBetween, context),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column _buildActionButton(
    Course course,
    double spaceBetween,
    BuildContext context,
  ) {
    return Column(
      children: [
        Text(
          'Price ${course.price}',
          style: AppTextStyles.bodyLarge.copyWith(
            color: AppColors.primaryColor.shade200,
          ),
        ),
        SizedBox(height: spaceBetween),
        SizedBox(
          height: kButtonHeight,
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
            onPressed: onAction,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kBorderRadius),
              ),
            ),
            child: Text(
              actionLabel,
              style: AppTextStyles.labelLarge,
            ),
          ),
        ),
      ],
    );
  }

  void onAction() {}
}

class ActionButton extends StatelessWidget {
  final Course course;

  const ActionButton({
    super.key,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    const double spaceBetween = 8;
    return Column(
      children: [
        Text(
          'Price ${course.price}',
          style: AppTextStyles.bodyLarge.copyWith(
            color: AppColors.primaryColor.shade200,
          ),
        ),
        const SizedBox(height: spaceBetween),
        SizedBox(
          height: kButtonHeight,
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kBorderRadius),
              ),
            ),
            child: const Text(
              'Register',
              style: AppTextStyles.labelLarge,
            ),
          ),
        ),
      ],
    );
  }
}
