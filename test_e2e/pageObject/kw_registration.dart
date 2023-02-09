import 'package:flutter_test/flutter_test.dart';
import 'package:oddshub/presentation/journey/course/course_list_constants.dart';
import 'package:oddshub/presentation/journey/registration/individual_payment/individual_payment_constants.dart';
import 'package:oddshub/presentation/journey/registration/registration_constants.dart';

class RegistrationPage {
  final WidgetTester tester;

  RegistrationPage(this.tester);

  Future<void> clickRegisterButton() async {
    final registerButton = find.byKey(CourseListConstants.registerButtonKey);
    await tester.tap(registerButton);
    await tester.pumpAndSettle();
  }

  Future<void> fillInTitle(String title) async {
    final titleTextFieldKey =
        find.byKey(RegistrationConstants.titleTextFieldKey);
    await tester.enterText(
      titleTextFieldKey,
      title,
    );
    await tester.pumpAndSettle();
  }

  Future<void> fillInNameAndLastName(String firstName, String lastName) async {
    await tester.enterText(
      find.byKey(RegistrationConstants.firstNameTextFieldKey),
      firstName,
    );
    await tester.pumpAndSettle();
    await tester.enterText(
      find.byKey(RegistrationConstants.lastNameTextFieldKey),
      lastName,
    );
    await tester.pumpAndSettle();
  }

  Future<void> fillInEmail(String email) async {
    await tester.enterText(
      find.byKey(RegistrationConstants.emailTextFieldKey),
      email,
    );
    await tester.pumpAndSettle();
  }

  Future<void> fillInPhoneNumber(String phoneNumber) async {
    await tester.enterText(
      find.byKey(RegistrationConstants.phoneNumberTextFieldKey),
      phoneNumber,
    );
    await tester.pumpAndSettle();
  }

  Future<void> clickSaveButton() async {
    final saveButton = find.byKey(RegistrationConstants.saveButtonKey);
    expect(saveButton, findsOneWidget);
    await tester.tap(saveButton);
    await tester.pumpAndSettle();
  }

  Future<void> clickOKButton() async {
    final okButton = find.byKey(IndividualPaymentConstants.okButtonKey);
    expect(okButton, findsOneWidget);
    await tester.tap(okButton);
    await tester.pumpAndSettle();
  }
}
