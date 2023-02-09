import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:oddshub/presentation/journey/send_email/send_email_bloc.dart';
import 'package:oddshub/presentation/journey/send_email/send_email_screen.dart';

import '../../../mock/mock_function.dart';
import '../../../mock/mock_observer.dart';
import '../../../mock/mock_route.dart';

void main() {
  late MockNavigatorObserver mockObserver;
  late Function() mockNavSuccess;

  setUp(
    () => {
      mockObserver = MockNavigatorObserver(),
      mockNavSuccess = MockFunction().callback
    },
  );

  setUpAll(MockRoute.setUp);
  Widget prepareWidget() {
    final mockSendEmailBloc = SendEmailBloc();
    final widget = MaterialApp(
      home: SendEmailScreen(
        sendEmailBloc: mockSendEmailBloc,
        navFail: () {},
        navSuccess: mockNavSuccess,
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
}
