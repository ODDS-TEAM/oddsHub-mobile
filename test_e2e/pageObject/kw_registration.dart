import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:oddshub/main.dart';

void suiteSetUp() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
}

Future<void> openApplication(
  WidgetTester tester,
  String title,
) async {
  await tester.pumpWidget(const MyApp());
  await tester.pump(const Duration(seconds: 1));
  final finder = find.text(title);
  expect(finder, findsOneWidget);
}

void waitUntilTheScreenShowsTitleMessage(WidgetTester tester, String title) {
  final finder = find.text(title);
  expect(finder, findsOneWidget);
}

void fillInUserName(WidgetTester tester, String userName) {
  final finder = find.text(userName);
  expect(finder, findsOneWidget);
}
