import 'package:flutter/material.dart';

class SendEmailScreen extends StatelessWidget {
  const SendEmailScreen({super.key});
  Key get sendButtonKey => const Key('send-email-button');
  Key get backButtonKey => const Key('back-button');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
              onPressed: () => {},
              child: const Text('Send'),
            ),
          ],
        ),
      ),
    );
  }
}
