import 'package:flutter/material.dart';
import 'package:oddshub/colors.dart';
import 'package:oddshub/routes.dart';

class RegistrationSuccessScreen extends StatelessWidget {
  const RegistrationSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryBackground,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'registration complete',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Text(
              'Mr. Done Tester',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Text(
              'Payment method',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const Image(image: AssetImage('assets/images/payment-qr.jpeg')),
            Text(
              'Please send the payment slip to this email jane@odds.team',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            ElevatedButton(
              onPressed: () => Navigator.popUntil(
                context,
                ModalRoute.withName(Routes.home),
              ),
              child: const Text('OK'),
            )
          ],
        ),
      ),
    );
  }
}
