import 'package:flutter/material.dart';
import 'package:oddshub/styles/colors.dart';
import 'package:oddshub/styles/shadow.dart';
import 'package:oddshub/styles/constant.dart';
import 'package:oddshub/styles/text.dart';

import '../model.dart';
import 'course_image.dart';

class CourseCard extends StatelessWidget {
  static const double height = 420.0;
  final Course course;
  final bool isTrainer;
  const CourseCard({
    Key? key,
    required this.course,
    required this.isTrainer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width80percent = MediaQuery.of(context).size.width * 0.8;
    return Container(
      height: CourseCard.height,
      margin: const EdgeInsets.only(bottom: kSpaceBetweenText),
      width: width80percent,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kBorderRadius),
        color: Colors.white,
        boxShadow: [AppShadows.card],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CourseImage(course: course),
          CardDetail(course: course),
        ],
      ),
    );
  }
}

class CardDetail extends StatelessWidget {
  static int maxTitleLine = 3;
  static int maxDetailLine = 4;
  final Course course;

  const CardDetail({
    super.key,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(kBorderRadius),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              course.name,
              style: AppTextStyles.labelLarge,
              maxLines: maxTitleLine,
            ),
            const SizedBox(height: kSpaceBetweenText),
            Text(
              course.description,
              style: AppTextStyles.bodySmall2.copyWith(
                color: AppColors.primaryColor.shade200,
              ),
              maxLines: maxDetailLine,
              overflow: TextOverflow.clip,
            ),
            const SizedBox(height: kSpaceBetweenText),
            TrainerProfileTag(course: course),
          ],
        ),
      ),
    );
  }
}

class TrainerProfileTag extends StatelessWidget {
  final Course course;

  const TrainerProfileTag({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          course.instructor,
          style: AppTextStyles.bodySmall.copyWith(
            color: AppColors.primaryColor.shade200,
          ),
        )
      ],
    );
  }
}
