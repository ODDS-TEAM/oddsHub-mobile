import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oddshub/presentation/journey/send_email/send_email_bloc.dart';
import 'package:oddshub/presentation/journey/send_email/send_email_constants.dart';
import 'package:oddshub/styles/colors.dart';

class SendEmailScreen extends StatelessWidget {
  final SendEmailBloc sendEmailBloc;
  final Function() navSuccess;
  final Function() navFail;

  const SendEmailScreen({
    Key? key,
    required this.sendEmailBloc,
    required this.navSuccess,
    required this.navFail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Send Mail'),
      ),
      body: BlocProvider(
        create: (context) => sendEmailBloc,
        child: BlocListener<SendEmailBloc, SendEmailState>(
          listener: (context, state) {
            if (state is SendEmailSuccessState) {
              navSuccess();
            } else {
              navFail();
            }
          },
          child: SafeArea(
            child: Center(
              child: Column(
                children: [
                  Card(
                    elevation: 8,
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: const EdgeInsets.all(16),
                    child: ElevatedButton(
                      key: SendEmailConstants.sendButtonKey,
                      onPressed: () => {
                        sendEmailBloc.add(
                          SendEmailOnPressEvent(),
                        ),
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                      ),
                      child: Text(
                        'Send',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: AppColors.primaryBackground,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
