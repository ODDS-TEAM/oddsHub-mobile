import 'package:flutter/material.dart';
import 'package:oddshub/course_list/model.dart';
import 'package:oddshub/styles/constant.dart';

class CourseImage extends StatelessWidget {
  static const double imageHeight = 200.0;
  final Course course;
  final bool withBorderRadius;

  const CourseImage({
    super.key,
    required this.course,
    this.withBorderRadius = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: imageHeight,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(course.image),
          fit: BoxFit.cover,
        ),
        borderRadius: withBorderRadius
            ? const BorderRadius.only(
                topLeft: Radius.circular(kBorderRadius),
                topRight: Radius.circular(kBorderRadius),
              )
            : null,
      ),
    );
  }
}
