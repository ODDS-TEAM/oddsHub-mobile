import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:oddshub/data/models/person.dart';
import 'package:oddshub/presentation/journey/registration/registration_success/registration_success_constants.dart';
import 'package:oddshub/presentation/journey/registration/registration_success/registration_success_screen.dart';

import '../../../../mock/mock_function.dart';

void main() {
  late Function() mockOkButtonDidTap;

  setUp(() {
    mockOkButtonDidTap = MockFunction().callback;
  });

  Widget _prepareWidget({Person? person}) {
    return MaterialApp(
      onGenerateRoute: (_) => MaterialPageRoute(
        builder: (context) {
          return RegistrationSuccessScreen(
            okButtonDidTap: mockOkButtonDidTap,
          );
        },
        settings: RouteSettings(arguments: person),
      ),
    );
  }

  testWidgets(
    'ok button can be pressed so that the user can go back to home screen',
    (WidgetTester tester) async {
      await tester.pumpWidget(_prepareWidget());

      final okButton = find.byKey(RegistrationSuccessConstants.okButtonKey);
      await tester.scrollUntilVisible(okButton, 20);
      await tester.tap(okButton);

      verify(mockOkButtonDidTap).called(1);
    },
  );

  testWidgets(
    'Should display payment instruction when user registration success',
    (tester) async {
      await tester.pumpWidget(_prepareWidget());

      expect(
        find.byKey(RegistrationSuccessConstants.titleKey),
        findsOneWidget,
      );
      expect(
        find.byKey(RegistrationSuccessConstants.subtitleKey),
        findsOneWidget,
      );
      expect(
        find.byKey(RegistrationSuccessConstants.paymentMethodTitleKey),
        findsOneWidget,
      );
      expect(
        find.byKey(RegistrationSuccessConstants.paymentQrImageKey),
        findsOneWidget,
      );
      expect(
        find.byKey(RegistrationSuccessConstants.paymentDescriptionKey),
        findsOneWidget,
      );
      expect(
        find.byKey(RegistrationSuccessConstants.okButtonKey),
        findsOneWidget,
      );
    },
  );

  testWidgets(
    'Should display customer full name',
    (tester) async {
      await tester.pumpWidget(
        _prepareWidget(person: Person('MR.', 'Pop', 'Kung')),
      );

      expect(
        find.text('MR. Pop Kung'),
        findsOneWidget,
      );
    },
  );

  testWidgets(
    'Should display course amount',
    (tester) async {
      await tester.pumpWidget(
        _prepareWidget(person: Person('MR.', 'Pop', 'Kung')),
      );

      expect(
        find.text('Price: ฿40,000'),
        findsOneWidget,
      );
    },
  );
}
