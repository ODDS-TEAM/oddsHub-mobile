import 'package:flutter/material.dart';
import 'package:oddshub/colors.dart';
import 'package:oddshub/data/models/course.dart';
import 'package:oddshub/presentation/journey/course/course_list_constants.dart';
import 'package:oddshub/routes.dart';

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
        children: [
          for (var course in courses)
            Card(
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
                    padding: const EdgeInsets.fromLTRB(20, 16, 16, 10),
                    child: Text(
                      course.name,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                    child: Text(
                      course.formattedDate,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                  ListTile(
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
                  Image.asset(course.image),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 10),
                    child: Text(
                      course.description,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                    child: createRegistrationButton(),
                  ),
                ],
              ),
            ),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, Routes.sendEmail),
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

  Widget createRegistrationButton() {
    return ElevatedButton(
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
}
