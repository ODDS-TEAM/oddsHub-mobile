import 'package:flutter/material.dart';
import 'package:oddshub/colors.dart';
import 'package:oddshub/presentation/journey/registration/registration_constants.dart';
import 'package:oddshub/presentation/journey/registration/registration_success/person.dart';
import 'package:oddshub/presentation/widget/common_text_field.dart';
import 'package:oddshub/presentation/widget/layout_appbar.dart';
import 'package:oddshub/routes.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreen();
}

class _RegistrationScreen extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Column(
        children: [
          const Text('Course Name:'),
          commonTextField(
            RegistrationConstants.titleTextFieldKey,
            'Title',
          ),
          commonTextField(
            RegistrationConstants.firstNameTextFieldKey,
            'First name',
          ),
          commonTextField(
            RegistrationConstants.lastNameTextFieldKey,
            'Last name',
          ),
          commonTextField(
            RegistrationConstants.emailTextFieldKey,
            'Email',
          ),
          commonTextField(
            RegistrationConstants.phoneNumberTextFieldKey,
            'Phone Number',
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    key: RegistrationConstants.cancelButtonKey,
                    onPressed: () => Navigator.pushNamed(
                      context,
                      Routes.home,
                    ),
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    key: RegistrationConstants.saveButtonKey,
                    onPressed: () => Navigator.pushNamed(
                      context,
                      Routes.registrationSuccess,
                      arguments: Person('MR.', 'Wut', 'Vort'),
                    ),
                    child: Text(
                      'Save',
                      style: Theme.of(context)
                          .textTheme
                          .button
                          ?.copyWith(color: AppColors.primaryBackground),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
