import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class RegistrationScreenActivity {
  final WidgetTester tester;

  RegistrationScreenActivity(this.tester);

  Future<void> fillInTitle(String title) async {
    final titleTextFieldKey = find.byKey(const Key('tiele'));
    await tester.enterText(
      titleTextFieldKey,
      title,
    );
    await tester.pumpAndSettle();
  }

  Future<void> fillInNameAndLastName(String firstName, String lastName) async {
    await tester.enterText(
      find.byKey(const Key('first_name')),
      firstName,
    );
    await tester.pumpAndSettle();
    await tester.enterText(
      find.byKey(const Key('last_name')),
      lastName,
    );
    await tester.pumpAndSettle();
  }

  Future<void> fillInEmail(String email) async {
    await tester.enterText(
      find.byKey(const Key('key')),
      email,
    );
    await tester.pumpAndSettle();
  }

  Future<void> fillInPhoneNumber(String phoneNumber) async {
    await tester.enterText(
      find.byKey(const Key('phone_number')),
      phoneNumber,
    );
    await tester.pumpAndSettle();
  }

  Future<void> clickDoneOnKeyboard() async {
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
  }

  Future<void> clickSaveButton() async {
    final saveButton = find.byKey(const Key('save_button'));
    expect(saveButton, findsOneWidget);
    await tester.tap(saveButton);
    await tester.pumpAndSettle();
  }

  Future<void> clickCancelButton() async {
    final cancelButton = find.byKey(const Key('cancel_button'));
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
    final discardButton = find.byKey(const Key('discard_button'));
    await tester.tap(discardButton);
    await tester.pumpAndSettle();
  }

  Future<void> clickContinueButton() async {
    final continueButton = find.byKey(const Key('continue_button'));
    await tester.tap(continueButton);
    await tester.pumpAndSettle();
  }
}
