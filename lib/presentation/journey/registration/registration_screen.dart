import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oddshub/data/entity/registration_user_entity.dart';
import 'package:oddshub/presentation/journey/registration/registration_bloc.dart';
import 'package:oddshub/presentation/journey/registration/registration_event.dart';
import 'package:oddshub/presentation/journey/registration/registration_state.dart';
import 'package:oddshub/styles/colors.dart';
import 'package:oddshub/presentation/journey/course/course_list_constants.dart';
import 'package:oddshub/presentation/journey/registration/registration_constants.dart';
import 'package:oddshub/presentation/widget/common_text_field.dart';

class RegistrationScreen extends StatefulWidget {
  final RegistrationBloc registrationBloc;
  final Function onTapDiscardButton;
  final Function onSuccess;
  const RegistrationScreen({
    Key? key,
    required this.registrationBloc,
    required this.onTapDiscardButton,
    required this.onSuccess,
  }) : super(key: key);

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
        title: const Text('registration'),
      ),
      body: BlocProvider(
        create: (context) => widget.registrationBloc,
        child: BlocListener<RegistrationBloc, RegistrationState>(
          listener: (context, state) {
            if (state is RegistrationSuccessState) {
              widget.onSuccess();
            } else if (state is RegistrationCancelState) {
              _showModalCancel();
            } else {
              _showSnackBarErrorMessage(
                context,
                RegistrationConstants.registrationFailedMessage,
              );
            }
          },
          child: SingleChildScrollView(
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
                          onPressed: () => widget.registrationBloc
                              .add(RegistrationOnPressCancelEvent()),
                          style:
                              ElevatedButton.styleFrom(primary: Colors.white),
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
                            widget.registrationBloc.add(
                              RegistrationOnPressSaveEvent(
                                RegistrationUserEntity(
                                  _titleController.text,
                                  _firstNameController.text,
                                  _lastNameController.text,
                                  _emailController.text,
                                  _phoneNumberController.text,
                                ),
                              ),
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
                    ],
                  )
                ],
              ),
            ),
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
      _showSnackBarErrorMessage(BuildContext context, String message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(message),
        key: RegistrationConstants.snackBarErrorMessageKey,
      ),
    );
  }
}
