import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:oddshub/data/models/individual_payment_information.dart';
import 'package:oddshub/styles/colors.dart';
import 'package:oddshub/data/datasources/remote/registration_remote_datasources.dart';
import 'package:oddshub/presentation/journey/course/course_list_constants.dart';
import 'package:oddshub/presentation/journey/registration/registration_constants.dart';
import 'package:oddshub/data/models/person.dart';
import 'package:oddshub/presentation/widget/common_text_field.dart';
import 'package:oddshub/routes.dart';

class RegistrationScreen extends StatefulWidget {
  final Function onTapDiscardButton;
  const RegistrationScreen({Key? key, required this.onTapDiscardButton})
      : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreen();
}

class _RegistrationScreen extends State<RegistrationScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Registration'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 30, 16, 10),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Image.asset(
                        CourseListConstants.clp.image,
                        height: 30,
                        width: 50,
                        fit: BoxFit.fitWidth,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        CourseListConstants.clp.name,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              commonTextField(
                RegistrationConstants.titleTextFieldKey,
                'Title (example: Mr., Miss)',
                _titleController,
              ),
              const SizedBox(
                height: 10,
              ),
              commonTextField(
                RegistrationConstants.firstNameTextFieldKey,
                'First name',
                _firstNameController,
              ),
              const SizedBox(
                height: 10,
              ),
              commonTextField(
                RegistrationConstants.lastNameTextFieldKey,
                'Last name',
                _lastNameController,
              ),
              const SizedBox(
                height: 10,
              ),
              commonTextField(
                RegistrationConstants.emailTextFieldKey,
                'Email',
                _emailController,
              ),
              const SizedBox(
                height: 10,
              ),
              commonTextField(
                RegistrationConstants.phoneNumberTextFieldKey,
                'Phone Number',
                _phoneNumberController,
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      key: RegistrationConstants.cancelButtonKey,
                      onPressed: _showModalCancel,
                      style: ElevatedButton.styleFrom(primary: Colors.white),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      key: RegistrationConstants.saveButtonKey,
                      onPressed: () => {
                        setState(
                          () => {
                            RegistrationRemoteDatasources()
                                .submitRegister(
                                  _titleController.text,
                                  _firstNameController.text,
                                  _lastNameController.text,
                                  _emailController.text,
                                  _phoneNumberController.text,
                                )
                                .then(
                                  (response) => {
                                    if (response.statusCode == 204)
                                      {
                                        Navigator.pushNamed(
                                          context,
                                          Routes.individualPayment,
                                          arguments:
                                              IndividualPaymentInformation(
                                            CourseListConstants.clp,
                                            Person(
                                              _titleController.text,
                                              _firstNameController.text,
                                              _lastNameController.text,
                                            ),
                                          ),
                                        )
                                      }
                                    else
                                      {
                                        // handle if fulled course
                                        if (jsonDecode(
                                              response.body,
                                            )['message'] ==
                                            'FULLED')
                                          {
                                            _showSnackBarErrorMessage(
                                              context,
                                              const Text(
                                                RegistrationConstants
                                                    .registrationFulledMessage,
                                              ),
                                            )
                                          }
                                        else
                                          {
                                            _showSnackBarErrorMessage(
                                              context,
                                              const Text(
                                                RegistrationConstants
                                                    .registrationFailedMessage,
                                              ),
                                            )
                                          }
                                      }
                                  },
                                )
                          },
                        ),
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
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showModalCancel() {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        key: RegistrationConstants.cancelDialogKey,
        title: const Text(RegistrationConstants.dialogTitle),
        content: const Text(RegistrationConstants.dialogContent),
        actions: <Widget>[
          TextButton(
            key: RegistrationConstants.continueButtonKey,
            onPressed: () => Navigator.pop(context),
            child: const Text(RegistrationConstants.continueButton),
          ),
          TextButton(
            key: RegistrationConstants.discardButtonKey,
            onPressed: () {
              widget.onTapDiscardButton.call();
            },
            child: const Text(RegistrationConstants.discardButton),
          ),
        ],
      ),
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      _showSnackBarErrorMessage(BuildContext context, Text message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: message,
        key: RegistrationConstants.snackBarErrorMessageKey,
      ),
    );
  }
}
