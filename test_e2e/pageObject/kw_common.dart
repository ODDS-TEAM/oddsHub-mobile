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
}
