import 'package:flutter/material.dart';
import 'package:oddshub/colors.dart';
import 'package:oddshub/data/datasources/remote/registration_remote_datasources.dart';
import 'package:oddshub/presentation/journey/registration/registration_constants.dart';
import 'package:oddshub/data/models/person.dart';
import 'package:oddshub/presentation/widget/common_text_field.dart';
import 'package:oddshub/presentation/widget/layout_appbar.dart';
import 'package:oddshub/routes.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreen();
}

class _RegistrationScreen extends State<RegistrationScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  // Future<void>? _futureRegister;

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
            _titleController,
          ),
          commonTextField(
            RegistrationConstants.firstNameTextFieldKey,
            'First name',
            _firstNameController,
          ),
          commonTextField(
            RegistrationConstants.lastNameTextFieldKey,
            'Last name',
            _lastNameController,
          ),
          commonTextField(
            RegistrationConstants.emailTextFieldKey,
            'Email',
            _emailController,
          ),
          commonTextField(
            RegistrationConstants.phoneNumberTextFieldKey,
            'Phone Number',
            _phoneNumberController,
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
                    onPressed: () => {
                      setState(
                        () => {
                          RegistrationRemoteDatasources().submitRegister(
                            _titleController.text,
                            _firstNameController.text,
                            _lastNameController.text,
                            _emailController.text,
                            _phoneNumberController.text,
                          )
                        },
                      ),
                      Navigator.pushNamed(
                        context,
                        Routes.registrationSuccess,
                        arguments: Person('MR.', 'Wut', 'Vort'),
                      )
                    },
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
