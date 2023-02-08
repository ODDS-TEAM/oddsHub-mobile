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

      final backButton =
          find.byKey(const Key('registration_success_ok_button'));
      await tester.tap(backButton);

      verify(mockOkButtonDidTap).called(1);
    },
  );

  testWidgets(
    'Should display payment instruction when user registration success',
    (tester) async {
      final mockOkButtonDidTap = MockFunction().callback;
      final mockObserver = MockNavigatorObserver();

      final widget = MaterialApp(
        home: RegistrationSuccessScreen(okButtonDidTap: mockOkButtonDidTap),
        navigatorObservers: [mockObserver],
      );

      await tester.pumpWidget(widget);

      expect(
        find.byKey(const Key('registration_success_title')),
        findsOneWidget,
      );
      expect(
        find.byKey(const Key('registration_success_sub_title')),
        findsOneWidget,
      );
      expect(
        find.byKey(const Key('registration_success_payment_method_title')),
        findsOneWidget,
      );
      expect(
        find.byKey(const Key('registration_success_payment_qr_image')),
        findsOneWidget,
      );
      expect(
        find.byKey(const Key('registration_success_payment_description')),
        findsOneWidget,
      );
      expect(
        find.byKey(const Key('registration_success_ok_button')),
        findsOneWidget,
      );
    },
  );
}
