import 'package:flutter/material.dart';
import 'package:oddshub/colors.dart';
import 'package:oddshub/presentation/journey/Registration/registration_success_screen.dart';
import 'package:oddshub/presentation/widget/common_text_field.dart';
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
      body: Column(
        children: [
          const Text('Course Name:'),
          commonTextField('Title'),
          commonTextField('First name'),
          commonTextField('Last name'),
          commonTextField('Email'),
          commonTextField('Phone Number'),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    onPressed: () => {},
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
                    onPressed: () => Navigator.pushNamed(
                      context,
                      Routes.registrationSuccess,
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
