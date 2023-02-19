import 'package:flutter/material.dart';
import 'package:oddshub/routes.dart';
import 'package:oddshub/styles/colors.dart';

import '../course.dart';

class CourseCard extends StatelessWidget {
  final Course course;
  final bool isTrainer;
  const CourseCard({Key? key, required this.course, required this.isTrainer})
      : super(key: key);

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
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course.name,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(height: 16),
                Text(
                  course.formattedDate,
                  style: Theme.of(context).textTheme.titleMedium,
                )
              ],
            ),
          ),
          Image.asset(course.image),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TrainerProfileTag(course: course),
                const SizedBox(height: 16),
                Text(
                  course.description,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 16),
                CourseActionButton(
                  label: isTrainer ? 'Go to send email' : 'Register',
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      isTrainer ? Routes.sendEmail : Routes.registration,
                      arguments: course,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CourseActionButton extends StatelessWidget {
  final String label;
  final void Function()? onPressed;

  const CourseActionButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: const Key('register_button_key'),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: AppColors.primaryBackground,
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
        const CircleAvatar(
          backgroundImage: AssetImage('assets/images/logo.png'),
        ),
        const SizedBox(width: 16),
        Text(
          course.instructor,
          style: Theme.of(context).textTheme.titleMedium,
        )
      ],
    );
  }
}
