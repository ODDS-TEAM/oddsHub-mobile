import 'package:flutter_test/flutter_test.dart';
import 'package:oddshub/presentation/journey/course/course_list_constants.dart';

class CourseListScreenActivity {
  final WidgetTester tester;

  CourseListScreenActivity(this.tester);

  Future<void> clickRegisterButton() async {
    final registerButton = find.byKey(CourseListConstants.registerButtonKey);
    await tester.tap(registerButton);
    await tester.pumpAndSettle();
  }

  void waitUntilTheScreenShowsTitleMessage(String title) {
    final finder = find.text(title);
    expect(finder, findsOneWidget);
  }
}
