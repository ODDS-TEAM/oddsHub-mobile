import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Course {
  final String name;
  final String description;
  final String instructor;
  final DateTime startDate;

  Course(this.name, this.description, this.instructor, this.startDate);
}

final List<Course> courses = [
  Course('Product Discovery', 'Just overview', 'Jane', DateTime.now()),
];

class CourseListScreen extends StatefulWidget {
  const CourseListScreen({Key? key}) : super(key: key);

  @override
  State<CourseListScreen> createState() => _CourseListScreenState();
}

class _CourseListScreenState extends State<CourseListScreen> {
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
              margin: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                    child: Text(
                      course.name,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                  ListTile(
                    leading: const CircleAvatar(
                      backgroundImage: AssetImage(
                        'assets/images/logo.png',
                      ),
                    ),
                    title: Text(
                      'Instructor: ${course.instructor}',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                  Image.asset('assets/images/product_Dis_covery.png'),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                    child: Text(
                      'Description: ${course.description}',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                    child: Text(
                      'Date: ${DateFormat.yMMMMd('en_US').format(course.startDate)}',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}