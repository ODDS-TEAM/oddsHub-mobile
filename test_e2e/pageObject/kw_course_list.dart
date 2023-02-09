import 'package:flutter_test/flutter_test.dart';

void waitUntilTheScreenShowsTitleMessage(WidgetTester tester, String title) {
  final finder = find.text(title);
  expect(finder, findsOneWidget);
}
