import 'package:flutter/material.dart';
import 'package:oddshub/colors.dart';

class RegistrationSuccessScreen extends StatelessWidget {
  final Function() okButtonDidTap;

  const RegistrationSuccessScreen({
    Key? key,
    required this.okButtonDidTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryBackground,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              key: const Key('registration_success_title'),
              'registration complete',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Text(
              key: const Key('registration_success_sub_title'),
              'Mr. Done Tester',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Text(
              key: const Key('registration_success_payment_method_title'),
              'Payment method',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const Image(
              key: Key('registration_success_payment_qr_image'),
              image: AssetImage('assets/images/payment-qr.jpeg'),
            ),
            Text(
              key: const Key('registration_success_payment_description'),
              'Please send the payment slip to this email jane@odds.team',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            ElevatedButton(
              key: const Key('registration_success_ok_button'),
              onPressed: okButtonDidTap,
              child: const Text('OK'),
            )
          ],
        ),
      ),
    );
  }
}
