import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class SendEmailSuccessActivity {
  final WidgetTester tester;
  SendEmailSuccessActivity(this.tester);

  Future<void> clickGoToSendEmailButton() async {
    final goToSendEmail = find.byKey(const Key('send-email'));
    await tester.tap(goToSendEmail);
    await tester.pumpAndSettle();
  }

  Future<void> clickSendEmailButton() async {
    final sendButton = find.byKey(const Key('send-button'));
    await tester.tap(sendButton);
    await tester.pumpAndSettle();
  }

  Future<void> foundTextSuccess(String text) async {
    final successText = find.text(text);
    expect(successText, findsOneWidget);
    await tester.pumpAndSettle();
  }

  Future<void> clickGoToHomeButton() async {
    final goToHomeButton = find.byKey(const Key('go-home-button'));
    await tester.tap(goToHomeButton);
    await tester.pumpAndSettle();
  }
}
