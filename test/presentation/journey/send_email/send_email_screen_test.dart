import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:oddshub/presentation/journey/send_email/send_email_screen.dart';

import '../../../mock.dart';

void main() {
  late MockNavigatorObserver mockObserver;

  setUp(
    () => {mockObserver = MockNavigatorObserver()},
  );

  setUpAll(FakeRoute.setUp);
  Widget prepareWidget() {
    final widget = MaterialApp(
      home: const SendEmailScreen(),
      navigatorObservers: [mockObserver],
    );

    return widget;
  }

  testWidgets('when trainer pressing send button then email should be sent',
      (WidgetTester tester) async {
    final widget = prepareWidget();
    await tester.pumpWidget(widget);

    expect(find.byKey(const Key('send-email-button')), findsOneWidget);
  });
  testWidgets(
      'when trainer pressing back button then trainer go back to home page ',
      (WidgetTester tester) async {
    final widget = prepareWidget();
    final backButton = find.byKey(const Key('back-button'));
    await tester.pumpWidget(widget);

    verify(() => mockObserver.didPush(any(), any()));

    expect(backButton, findsOneWidget);
    expect(backButton, findsWidgets);
  });
}
