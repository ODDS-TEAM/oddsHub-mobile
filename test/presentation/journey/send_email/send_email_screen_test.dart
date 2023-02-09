import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:oddshub/presentation/journey/send_email/send_email_bloc.dart';
import 'package:oddshub/presentation/journey/send_email/send_email_screen.dart';

import '../../../mock/mock_observer.dart';
import '../../../mock/mock_route.dart';

void main() {
  late MockNavigatorObserver mockObserver;

  setUp(
    () => {mockObserver = MockNavigatorObserver()},
  );

  setUpAll(MockRoute.setUp);
  Widget prepareWidget() {
    final mockSendEmailBloc = SendEmailBloc();
    final widget = MaterialApp(
      home: SendEmailScreen(
        sendEmailBloc: mockSendEmailBloc,
        navFail: () {},
        navSuccess: () {},
      ),
      navigatorObservers: [mockObserver],
    );

    return widget;
  }

  testWidgets('when trainer pressing send button then email should be sent',
      (WidgetTester tester) async {
    final widget = prepareWidget();
    await tester.pumpWidget(widget);

    expect(find.byKey(const Key('send_email_button')), findsOneWidget);
  });
  testWidgets(
      'when trainer pressing back button then trainer go back to home screen',
      (WidgetTester tester) async {
    final widget = prepareWidget();
    final backButton = find.byKey(const Key('back_button'));
    await tester.pumpWidget(widget);

    verify(() => mockObserver.didPush(any(), any()));

    expect(backButton, findsOneWidget);
  });
}
