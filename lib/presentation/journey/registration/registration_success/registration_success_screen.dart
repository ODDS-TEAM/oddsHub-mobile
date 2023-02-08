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
              key: RegistrationSuccessConstants.titleKey,
              'registration complete',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Text(
              key: RegistrationSuccessConstants.subtitleKey,
              name,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Text(
              key: RegistrationSuccessConstants.paymentMethodTitleKey,
              'Payment method',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Image(
              key: RegistrationSuccessConstants.paymentQrImageKey,
              image: const AssetImage('assets/images/payment-qr.jpeg'),
            ),
            Text(
              key: RegistrationSuccessConstants.paymentDescriptionKey,
              'Please send the payment slip to this email jane@odds.team',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            ElevatedButton(
              key: RegistrationSuccessConstants.okButtonKey,
              onPressed: okButtonDidTap,
              child: const Text('OK'),
            )
          ],
        ),
      ),
    );
  }
}
