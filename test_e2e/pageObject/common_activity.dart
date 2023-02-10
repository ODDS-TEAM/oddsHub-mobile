import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:oddshub/config.dart';
import 'package:oddshub/data/datasources/remote/my_client.dart';
import 'package:oddshub/main.dart';

class CommonActivity {
  final WidgetTester tester;
  final bool isTrainer;

  CommonActivity(this.tester, {this.isTrainer = false});

  static void suiteSetUp() {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  }

  Future<void> openApplication(
    String title,
  ) async {
    MyClient.httpClient = HttpClient();
    await tester.pumpWidget(
      MyApp(
        appConfigs: AppConfigs(overrideIsTrainer: isTrainer),
      ),
    );
    await tester.pump(const Duration(seconds: 1));
  }
}
