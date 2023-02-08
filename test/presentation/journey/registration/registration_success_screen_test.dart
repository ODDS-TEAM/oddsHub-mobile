import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:oddshub/presentation/journey/registration/registration_success_screen.dart';

import '../../../mock/mock_function.dart';
import '../../../mock/mock_observer.dart';

void main() {
  testWidgets(
    'Should navigate back When user tap the ok button',
    (WidgetTester tester) async {
      final mockOkButtonDidTap = MockFunction().callback;
      final mockObserver = MockNavigatorObserver();

      final widget = MaterialApp(
        home: RegistrationSuccessScreen(okButtonDidTap: mockOkButtonDidTap),
        navigatorObservers: [mockObserver],
      );

      await tester.pumpWidget(widget);

      final backButton = find.byKey(const Key('ok-button'));
      await tester.tap(backButton);

      verify(mockOkButtonDidTap).called(1);
    },
  );
}
