import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:oddshub/presentation/journey/registration/registration_constants.dart';
import 'package:oddshub/presentation/journey/registration/registration_screen.dart';

import '../../../mock/mock_function.dart';
import '../../../mock/mock_observer.dart';
import '../../../mock/mock_route.dart';

void main() {
  late MockNavigatorObserver mockNavigatorObserver;
  late Function() mockDiscardButtonTap;

  setUpAll(MockRoute.setUp);

  setUp(() => {
        mockNavigatorObserver = MockNavigatorObserver(),
        mockDiscardButtonTap = MockFunction().callback,
      },);

  Widget prepareWidget() {
    return MaterialApp(
      home: RegistrationScreen(
        onTapDiscardButton: mockDiscardButtonTap,
      ),
      navigatorObservers: [mockNavigatorObserver],
    );
  }

  testWidgets(
      'when user press save button '
      'then navigate to registration success screen',
      (WidgetTester tester) async {
    final widget = prepareWidget();
    final saveButton = find.byKey(const Key('save_button'));

    await tester.pumpWidget(widget);

    verify(() => mockNavigatorObserver.didPush(any(), any()));
    expect(saveButton, findsOneWidget);
  });

  testWidgets(
      'when user press cancel button '
      'then show dialog', (WidgetTester tester) async {
    final widget = prepareWidget();
    final cancelButton = find.byKey(RegistrationConstants.cancelButtonKey);
    final cancelDialog = find.byKey(RegistrationConstants.cancelDialogKey);

    await tester.pumpWidget(widget);
    await tester.pump(const Duration(seconds: 1));
    await tester.tap(cancelButton);
    await tester.pump(const Duration(seconds: 1));

    expect(cancelDialog, findsOneWidget);
    expect(cancelButton, findsOneWidget);
  });

  testWidgets(
      'when user press discard button on cancel dialog'
      'then navigate to home', (WidgetTester tester) async {
    final widget = prepareWidget();
    final cancelButton = find.byKey(RegistrationConstants.cancelButtonKey);
    final cancelDialog = find.byKey(RegistrationConstants.cancelDialogKey);
    final discardButton = find.byKey(RegistrationConstants.discardButtonKey);

    await tester.pumpWidget(widget);
    await tester.pump(const Duration(seconds: 1));
    await tester.tap(cancelButton);
    await tester.pump(const Duration(seconds: 3));
    await tester.tap(discardButton);
    await tester.pump(const Duration(seconds: 1));

    verify(mockDiscardButtonTap).called(1);
    expect(cancelDialog, findsOneWidget);
    expect(cancelButton, findsOneWidget);
  });
}
