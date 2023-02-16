import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:oddshub/config.dart';
import 'package:oddshub/main.dart';

void main() {
  testWidgets('Enter registration screen from course list', (tester) async {
    await tester.pumpWidget(
      MyApp(appConfigs: AppConfigs(overrideIsTrainer: false)),
    );
    await tester.tap(find.text('Register').first, warnIfMissed: false);
    await tester.pumpAndSettle();
    final appBarTitle = find.text('Registration');
    expect(appBarTitle, findsOneWidget);
  });

  testWidgets('Display course image', (tester) async {
    await tester.pumpWidget(
      MyApp(appConfigs: AppConfigs(overrideIsTrainer: false)),
    );
    await tester.tap(find.text('Register').first, warnIfMissed: false);
    await tester.pumpAndSettle();

    final image = find.byType(Image);
    expect(image, findsOneWidget);
  });
}
