import 'package:flutter/material.dart';

class RegistrationConstants {
  static const Key titleTextFieldKey = Key('title');
  static const Key firstNameTextFieldKey = Key('first_name');
  static const Key lastNameTextFieldKey = Key('last_name');
  static const Key emailTextFieldKey = Key('email');
  static const Key phoneNumberTextFieldKey = Key('phone_number');
  static const Key saveButtonKey = Key('save_button');
  static const Key cancelButtonKey = Key('cancel_button');
  static const Key cancelDialogKey = Key('cancel_dialog');
  static const Key discardButtonKey = Key('discard_button');
  static const Key continueButtonKey = Key('continue_button');
  static const Key snackBarErrorMessageKey = Key('snackbar_error_message');
  static const String dialogTitle = 'Are you sure you want to discard?';
  static const String dialogContent =
      'All progress in this session will be lost.';
  static const String continueButton = 'Continue register';
  static const String discardButton = 'Discard';
  static const String registrationFailedMessage =
      'Registration failed pleasee try again ka';
  static const String registrationFulledMessage = 'Course is full';
}
