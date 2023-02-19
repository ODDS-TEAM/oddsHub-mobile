import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class IndividualPaymentScreenActivity {
  final WidgetTester tester;

  IndividualPaymentScreenActivity(this.tester);

  Future<void> clickOKButton() async {
    final okButton = find.byKey(const Key('ok'));
    expect(okButton, findsOneWidget);
    await tester.tap(okButton);
    await tester.pumpAndSettle();
  }

  Future<void> foundTitleAndTailText({
    required String title,
    required String tail,
  }) async {
    final titleText = find.text(title);
    expect(titleText, findsOneWidget);
    final tailText = find.text(tail);
    expect(tailText, findsOneWidget);
    await tester.pumpAndSettle();
  }
}
