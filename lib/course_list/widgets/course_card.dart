import 'package:flutter/material.dart';
import 'package:oddshub/styles/colors.dart';
import 'package:oddshub/styles/text.dart';

import '../course.dart';

class CourseCard extends StatelessWidget {
  static const double height = 400.0;
  final Course course;
  final bool isTrainer;
  const CourseCard({
    Key? key,
    required this.course,
    required this.isTrainer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: CourseCard.height,
      margin: const EdgeInsets.only(bottom: 10),
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 15,
            spreadRadius: -5,
            color: AppColors.primaryColor.withOpacity(0.25),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(course.image),
                fit: BoxFit.cover,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
          ),
          CardDetail(course: course),
        ],
      ),
    );
  }
}

class CardDetail extends StatelessWidget {
  const CardDetail({
    super.key,
    required this.course,
  });

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              course.name,
              style: AppTextStyles.labelLarge,
              maxLines: 3,
            ),
            const SizedBox(height: 10),
            Text(
              course.description,
              style: AppTextStyles.bodySmall2.copyWith(
                color: AppColors.primaryColor.shade200,
              ),
              maxLines: 4,
              overflow: TextOverflow.clip,
            ),
            const SizedBox(height: 10),
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
          'by ${course.instructor}',
          style: AppTextStyles.bodySmall.copyWith(
            color: AppColors.primaryColor.shade200,
          ),
        )
      ],
    );
  }
}
