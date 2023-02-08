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
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      body: SafeArea(
        minimum: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(8),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Text(
                  key: RegistrationSuccessConstants.titleKey,
                  'Registration Complete',
                  style: Theme.of(context).textTheme.headline1,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  key: RegistrationSuccessConstants.subtitleKey,
                  name,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  key: RegistrationSuccessConstants.paymentMethodTitleKey,
                  'Payment method',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                const SizedBox(
                  height: 5,
                ),
                Image(
                  key: RegistrationSuccessConstants.paymentQrImageKey,
                  image: AssetImage(
                    RegistrationSuccessConstants.paymentQrImage,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  key: RegistrationSuccessConstants.paymentDescriptionKey,
                  'Please send the payment slip to this email jane@odds.team',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  key: RegistrationSuccessConstants.okButtonKey,
                  onPressed: okButtonDidTap,
                  child: const Text('OK'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
