import 'package:flutter/widgets.dart';

import 'models/course.dart';

class CourseListConstants {
  static const Key registerButtonKey = Key('register_button_key');
  static const Key sendEmailButtonKey = Key('go_to_send_email_button_key');
  static const String oddsLogoImage = 'assets/images/logo.png';

  static Course clp = Course(
    'Certified LeSS Practitioner',
    'assets/images/courses/clp.png',
    '''An in-depth course covering the LeSS principles, framework and rules, and guides. It provides essential information for adopting and improving LeSS to your product development group.''',
    'Bas Vodde',
    40000,
    DateTime(2023, 5, 29),
  );

  static Course productDiscovery = Course(
    'Product Discovery',
    'assets/images/courses/product_discovery.png',
    '''An in-depth course covering the LeSS principles, framework and rules, and guides. It provides essential information for adopting and improving LeSS to your product development group.''',
    'Jane makub',
    45000,
    DateTime(2023, 4, 22),
  );

  static Course tdd = Course(
    'Test Driven Development',
    'assets/images/courses/clp.png',
    '''An in-depth course covering the LeSS principles, framework and rules, and guides. It provides essential information for adopting and improving LeSS to your product development group.''',
    'Jua compe',
    35000,
    DateTime(2023, 5, 22),
  );
}
