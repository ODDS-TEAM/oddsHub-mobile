import 'package:flutter/material.dart';
import 'package:oddshub/presentation/journey/send_email/send_email_result.dart';
import 'package:oddshub/styles/colors.dart';

class SendMailSuccessScreen extends StatelessWidget {
  const SendMailSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SendEmailResult(
      icon: Icons.check_circle_outline,
      message: 'Send email success',
      color: AppColors.success,
    );
  }
}
