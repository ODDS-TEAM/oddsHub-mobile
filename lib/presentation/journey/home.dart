import 'package:flutter/material.dart';
import 'package:oddshub/config.dart';
import 'package:oddshub/presentation/journey/course/course_list_screen.dart';

class HomePage extends StatelessWidget {
  final AppConfigs appConfigs;
  const HomePage({
    Key? key,
    required this.appConfigs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('ODDS'),
      ),
      body: CourseListScreen(
        appConfigs: appConfigs,
      ),
    );
  }
}
