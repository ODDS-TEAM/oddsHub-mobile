import 'package:flutter_test/flutter_test.dart';
import 'package:oddshub/presentation/journey/registration/registration_constants.dart';

class RegistrationScreenActivity {
  final WidgetTester tester;

  RegistrationScreenActivity(this.tester);

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

  Future<void> clickDoneOnKeyboard() async {
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
  }

  Future<void> clickSaveButton() async {
    final saveButton = find.byKey(RegistrationConstants.saveButtonKey);
    expect(saveButton, findsOneWidget);
    await tester.tap(saveButton);
    await tester.pumpAndSettle();
  }

  Future<void> clickCancelButton() async {
    final cancelButton = find.byKey(RegistrationConstants.cancelButtonKey);
    await tester.tap(cancelButton);
    await tester.pumpAndSettle();
  }

  Future<void> showPopUpAndFoundTitlePopUp({
    required String titleCancel,
  }) async {
    final title = find.text(titleCancel);
    expect(title, findsOneWidget);
  }

  Future<void> clickDiscardButton() async {
    final discardButton = find.byKey(RegistrationConstants.discardButtonKey);
    await tester.tap(discardButton);
    await tester.pumpAndSettle();
  }

  Future<void> clickContinueButton() async {
    final continueButton = find.byKey(RegistrationConstants.continueButtonKey);
    await tester.tap(continueButton);
    await tester.pumpAndSettle();
  }
}
