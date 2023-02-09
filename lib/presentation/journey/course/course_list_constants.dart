import 'package:oddshub/data/models/course.dart';

class CourseListConstants {
  static const String oddsLogoImage = 'assets/images/logo.png';

  static Course clp = Course(
    'Certified LeSS Practitioner',
    'assets/images/courses/clp.png',
    '''An in-depth course covering the LeSS principles, framework and rules, and guides. It provides essential information for adopting and improving LeSS to your product development group.''',
    'Bas Vodde',
    40000,
    DateTime(2023, 5, 29),
  );
}
