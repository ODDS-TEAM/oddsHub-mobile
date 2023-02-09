import 'package:flutter/material.dart';
import 'package:oddshub/data/models/course.dart';
import 'package:oddshub/routes.dart';
import 'package:oddshub/styles/colors.dart';

import '../course_list_constants.dart';

class CourseCard extends StatelessWidget {
  final Course course;

  const CourseCard({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 10),
            child: Text(
              course.name,
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
            child: Text(
              course.formattedDate,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Image.asset(course.image),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 16, 0),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundImage: AssetImage(
                  CourseListConstants.oddsLogoImage,
                ),
              ),
              title: Text(
                course.instructor,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 10),
            child: Text(
              course.description,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 20),
            child: 1 == 2
                ? createRegistrationButton(context)
                : createSendmailButton(context),
          ),
        ],
      ),
    );
  }

  Widget createRegistrationButton(BuildContext context) {
    return ElevatedButton(
      key: CourseListConstants.registerButtonKey,
      onPressed: () => Navigator.pushNamed(context, Routes.registration),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
      ),
      child: Text(
        'Register',
        style: Theme.of(context).textTheme.button?.copyWith(
              color: AppColors.primaryBackground,
            ),
      ),
    );
  }

  Widget createSendmailButton(BuildContext context) {
    return ElevatedButton(
      key: CourseListConstants.sendMailButtonKey,
      onPressed: () => Navigator.pushNamed(context, Routes.sendEmail),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
      ),
      child: Text(
        'Go to send email',
        style: Theme.of(context).textTheme.button?.copyWith(
              color: AppColors.primaryBackground,
            ),
      ),
    );
  }
}
