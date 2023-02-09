import 'package:flutter_test/flutter_test.dart';
import 'package:oddshub/presentation/journey/course/course_list_constants.dart';
import 'package:oddshub/presentation/journey/registration/registration_constants.dart';
import 'package:oddshub/presentation/journey/registration/registration_success/registration_success_constants.dart';
import 'pageObject/kw_registration.dart';

void main() {
  suiteSetUp();

  testWidgets('Registration successfully', (tester) async {
    await openApplication(tester, 'OddsHub');
    final registerButton = find.byKey(CourseListConstants.registerButtonKey);
    await tester.tap(registerButton);
    await tester.pumpAndSettle();
    await tester.enterText(
      find.byKey(RegistrationConstants.titleTextFieldKey),
      'Nong',
    );
    await tester.pumpAndSettle();
    await tester.enterText(
      find.byKey(RegistrationConstants.firstNameTextFieldKey),
      'Newii',
    );
    await tester.pumpAndSettle();
    await tester.enterText(
      find.byKey(RegistrationConstants.lastNameTextFieldKey),
      'Huhu',
    );
    await tester.pumpAndSettle();
    await tester.enterText(
      find.byKey(RegistrationConstants.emailTextFieldKey),
      'Newii@odds.team',
    );
    await tester.pumpAndSettle();
    await tester.enterText(
      find.byKey(RegistrationConstants.phoneNumberTextFieldKey),
      '0987654321',
    );
    await tester.pumpAndSettle();
    final saveButton = find.byKey(RegistrationConstants.saveButtonKey);
    expect(saveButton, findsOneWidget);
    await tester.tap(saveButton);
    await tester.pumpAndSettle();
    final okButton = find.byKey(RegistrationSuccessConstants.okButtonKey);
    expect(okButton, findsOneWidget);
    await tester.tap(okButton);
    await tester.pumpAndSettle();
    waitUntilTheScreenShowsTitleMessage(tester, 'OddsHub');
  });
}
