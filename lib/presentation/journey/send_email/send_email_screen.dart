import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oddshub/presentation/journey/send_email/send_email_bloc.dart';

class SendEmailScreen extends StatelessWidget {
  final SendEmailBloc sendEmailBloc = SendEmailBloc();

  SendEmailScreen({Key? key}) : super(key: key);
  Key get sendButtonKey => const Key('send_email_button');
  Key get backButtonKey => const Key('back_button');

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SendEmailBloc(),
      child: BlocListener<SendEmailBloc, SendEmailState>(
        listener: (context, state) {
          if (state is SendEmailSuccessState) {}
        },
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                ElevatedButton(
                  key: backButtonKey,
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Back'),
                ),
                ElevatedButton(
                  key: sendButtonKey,
                  onPressed: () => {sendEmailBloc.add(SendEmailOnPressEvent())},
                  child: const Text('Send'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
