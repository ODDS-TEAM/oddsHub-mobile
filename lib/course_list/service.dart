import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:oddshub/utils/client.dart';

import 'models/course.dart';

class CourseService {
  static Future<List<Course>> getCourses() async {
    final List<Course> courses = [];
    final res = await http.get(Uri.parse('$apiUrl/courses'));
    for (final course in json.decode(res.body)) {
      courses.add(Course.fromJson(course));
    }
    return courses;
  }
}
