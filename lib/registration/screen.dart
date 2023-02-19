import 'package:flutter/material.dart';
import 'package:oddshub/config.dart';
import 'package:oddshub/course_list/course.dart';
import 'package:oddshub/course_list/screen.dart';
import 'package:oddshub/registration/model.dart';
import 'package:oddshub/registration/service.dart';

class RegistrationScreen extends StatefulWidget {
  static String path = '/registration';
  final AppConfigs appConfigs;
  const RegistrationScreen({super.key, required this.appConfigs});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final titleController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final course = ModalRoute.of(context)?.settings.arguments as Course;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text('Registration')),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    course.image,
                    height: 30,
                    width: 50,
                    fit: BoxFit.fitWidth,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    course.name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              OutlinedTextField(
                firstNameController: titleController,
                label: 'Title (example Mr. Miss)',
              ),
              const SizedBox(height: 16),
              OutlinedTextField(
                firstNameController: firstNameController,
                label: 'First name',
              ),
              const SizedBox(height: 16),
              OutlinedTextField(
                firstNameController: lastNameController,
                label: 'Last name',
              ),
              const SizedBox(height: 16),
              OutlinedTextField(
                firstNameController: emailController,
                label: 'E-mail',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              OutlinedTextField(
                firstNameController: phoneNumberController,
                label: 'Phone number',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      key: const Key('cancel_button'),
                      onPressed: onCancel,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      key: const Key('save_button'),
                      onPressed: () => onSave(context, course.classId),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      child: const Text(
                        'Save',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void onCancel() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Are you sure you want to discard?'),
          content: const Text('All progress in this session will be lost.'),
          actions: [
            TextButton(
              key: const Key('continue_button'),
              child: const Text('Continue register'),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              key: const Key('discard_button'),
              child: const Text('Discard'),
              onPressed: () => Navigator.popUntil(
                context,
                ModalRoute.withName(CourseListScreen.path),
              ),
            ),
          ],
        );
      },
    );
  }

  void onSave(BuildContext context, int classId) {
    FocusScope.of(context).unfocus();
    final registration = Registration(
      title: titleController.text,
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      email: emailController.text,
      phoneNumber: phoneNumberController.text,
    );
    if (!registration.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Registration failed please try again'),
          key: Key('snackbar_error_message'),
        ),
      );
    } else {
      RegistrationService.register(
        registration.toRequestRegistration(classId),
      ).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.green,
            content: Text('Registration successfully'),
          ),
        );
        Navigator.of(context).popUntil(
          ModalRoute.withName(CourseListScreen.path),
        );
      }).catchError((e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(e.toString()),
          ),
        );
      });
    }
  }
}

class OutlinedTextField extends StatelessWidget {
  final TextEditingController firstNameController;
  final String label;
  final TextInputType? keyboardType;
  const OutlinedTextField({
    super.key,
    required this.firstNameController,
    required this.label,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: firstNameController,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label,
      ),
    );
  }
}
