import 'package:flutter/material.dart';
import 'package:oddshub/send_email.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class Course {
  final String name;
  final String description;
  final String instructor;
  final DateTime startDate;

  Course(this.name, this.description, this.instructor, this.startDate);
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final List<Course> courses = [
      Course('Scrum', 'Just overview', 'Jane', DateTime.now())
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('OddsHub'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (var course in courses)
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  height: 250,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black26, width: 1),
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          'Course Name: ${course.name}',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        Text(
                          'Description: ${course.description}',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        ElevatedButton(
                          onPressed: (() => {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SendEmailPage(),
                                  ),
                                )
                              }),
                          child: const Text('Go to send email'),
                        )
                      ],
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
