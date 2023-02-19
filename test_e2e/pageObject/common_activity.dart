import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:oddshub/config.dart';
import 'package:oddshub/data/datasources/remote/my_client.dart';
import 'package:oddshub/main.dart';

class CommonActivity {
  final WidgetTester tester;
  final String role;

  CommonActivity(this.tester, {this.role = 'not_trainer'});

  static void suiteSetUp() {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  }

  Future<void> openApplication(
    String title,
  ) async {
    MyClient.httpClient = HttpClient();
    final isTrainer = role == 'trainer';
    await tester.pumpWidget(
      MyApp(
        appConfigs: AppConfigs(overrideIsTrainer: isTrainer),
      ),
    );
    await tester.pumpAndSettle(const Duration(seconds: 1));
  }
}
