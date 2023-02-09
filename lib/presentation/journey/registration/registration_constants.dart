import 'package:flutter/material.dart';

class RegistrationConstants {
  static const Key titleTextFieldKey = Key('title');
  static const Key firstNameTextFieldKey = Key('first_name');
  static const Key lastNameTextFieldKey = Key('last_name');
  static const Key emailTextFieldKey = Key('email');
  static const Key phoneNumberTextFieldKey = Key('phone_number');
  static const Key saveButtonKey = Key('save_button');
  static const Key cancelButtonKey = Key('cancel_button');
  static const String dialogTitle = 'Are you sure you want to discard?';
  static const String dialogContent = 'All progress in this session will be lost.';
  static const String continueButton = 'Continue register';
  static const String discardButton = 'Discard';
}
