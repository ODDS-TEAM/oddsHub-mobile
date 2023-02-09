import 'package:flutter/material.dart';
import 'package:oddshub/presentation/journey/send_email/send_email_result.dart';
import 'package:oddshub/styles/colors.dart';

class SendMailFailScreen extends StatelessWidget {
  const SendMailFailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SendEmailResult(
      icon: Icons.error_outline,
      message: 'Send email fail',
      color: AppColors.error,
    );
  }
}
