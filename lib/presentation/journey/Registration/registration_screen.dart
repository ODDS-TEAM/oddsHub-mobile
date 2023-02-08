import 'package:flutter/material.dart';
import 'package:oddshub/colors.dart';
import 'package:oddshub/presentation/journey/Registration/registration_success_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreen();
}

class _RegistrationScreen extends State<RegistrationScreen> {
  Widget _commonTextField(String text) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 55,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: text,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('Course Name:'),
          _commonTextField('Title'),
          _commonTextField('Name'),
          _commonTextField('Lastname'),
          _commonTextField('Email'),
          _commonTextField('Phone Number'),
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
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegistrationSuccessScreen(),
                      ),
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
