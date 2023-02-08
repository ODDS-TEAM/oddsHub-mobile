import 'package:flutter/material.dart';
import 'package:oddshub/colors.dart';
import 'package:oddshub/presentation/journey/registration/registration_success/person.dart';
import 'package:oddshub/presentation/journey/registration/registration_success/registration_success_constants.dart';

class RegistrationSuccessScreen extends StatelessWidget {
  final Function() okButtonDidTap;

  const RegistrationSuccessScreen({
    Key? key,
    required this.okButtonDidTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final person = ModalRoute.of(context)?.settings.arguments as Person?;
    final name = person?.fullName ?? '';

    return Container(
      color: AppColors.primaryBackground,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              key: RegistrationSuccessConstants.title,
              'registration complete',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Text(
              key: RegistrationSuccessConstants.subtitle,
              name,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Text(
              key: RegistrationSuccessConstants.paymentMethodTitle,
              'Payment method',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Image(
              key: RegistrationSuccessConstants.paymentQrImage,
              image: const AssetImage('assets/images/payment-qr.jpeg'),
            ),
            Text(
              key: RegistrationSuccessConstants.paymentDescription,
              'Please send the payment slip to this email jane@odds.team',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            ElevatedButton(
              key: RegistrationSuccessConstants.okButton,
              onPressed: okButtonDidTap,
              child: const Text('OK'),
            )
          ],
        ),
      ),
    );
  }
}
