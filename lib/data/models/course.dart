import 'package:intl/intl.dart';

class Course {
  final String name;
  final String image;
  final String description;
  final String instructor;
  final DateTime startDate;

  Course(
    this.name,
    this.image,
    this.description,
    this.instructor,
    this.startDate,
  );

  String get formattedDate {
    return DateFormat.yMMMMd('en_US').format(startDate);
  }
}