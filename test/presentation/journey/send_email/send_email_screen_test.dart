import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:oddshub/presentation/journey/send_email/send_email_bloc.dart';
import 'package:oddshub/presentation/journey/send_email/send_email_constants.dart';
import 'package:oddshub/presentation/journey/send_email/send_email_screen.dart';

import '../../../mock/mock_function.dart';
import '../../../mock/mock_observer.dart';
import '../../../mock/mock_route.dart';

class FakeSendEmailEvent extends Fake implements SendEmailEvent {}

class FakeSendEmailState extends Fake implements SendEmailState {}

class MockSendMailBloc extends MockBloc<SendEmailEvent, SendEmailState>
    implements SendEmailBloc {
  static void setUp() {
    registerFallbackValue(FakeSendEmailEvent());
    registerFallbackValue(FakeSendEmailState());
  }
}

void main() {
  late MockNavigatorObserver mockObserver;
  late Function() mockNavSuccess;
  late MockSendMailBloc mockSendEmailBloc;

  setUpAll(() {
    MockRoute.setUp();
    MockSendMailBloc.setUp();
  });

  setUp(
    () => {
      mockObserver = MockNavigatorObserver(),
      mockNavSuccess = MockFunction().callback,
      mockSendEmailBloc = MockSendMailBloc(),
    },
  );
  Widget prepareWidget() {
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
    whenListen(
      mockSendEmailBloc,
      Stream<SendEmailState>.fromIterable([
        SendEmailSuccessState(),
      ]),
      initialState: SendEmailInitialState(),
    );

    // arrange
    final widget = prepareWidget();
    await tester.pumpWidget(widget);

    // act
    final sendBtn = find.byKey(SendEmailConstants.sendButtonKey);
    await tester.tap(sendBtn);
    await tester.pumpAndSettle();

    // assert
    verify(mockNavSuccess).called(1);
  });
}
