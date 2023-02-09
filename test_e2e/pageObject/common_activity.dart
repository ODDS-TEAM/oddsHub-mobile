import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:oddshub/config.dart';
import 'package:oddshub/main.dart';

class CommonActivity {
  final WidgetTester tester;

  CommonActivity(this.tester);

  static void suiteSetUp() {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  }

  Future<void> openApplication(
    String title,
  ) async {
    await tester.pumpWidget(
      MyApp(
        appConfigs: AppConfigs(overrideIsTrainer: false),
      ),
    );
    await tester.pump(const Duration(seconds: 1));
  }
}