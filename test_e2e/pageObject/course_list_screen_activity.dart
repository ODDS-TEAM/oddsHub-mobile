import 'package:flutter_test/flutter_test.dart';

class CourseListScreenActivity {
  final WidgetTester tester;

  CourseListScreenActivity(this.tester);

  Future<void> clickRegisterButton() async {
    final registerButton = find.text('Register').first;
    await tester.tap(registerButton, warnIfMissed: false);
    await tester.pumpAndSettle();
  }

  void waitUntilTheScreenShowsTitleMessage(String title) {
    final finder = find.text(title);
    expect(finder, findsOneWidget);
  }
}
