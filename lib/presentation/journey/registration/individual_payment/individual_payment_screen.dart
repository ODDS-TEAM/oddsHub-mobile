import 'package:flutter/material.dart';
import 'package:oddshub/data/models/individual_payment_information.dart';
import 'package:oddshub/styles/colors.dart';
import 'package:oddshub/presentation/journey/registration/individual_payment/individual_payment_constants.dart';

class IndividualPaymentScreen extends StatelessWidget {
  final Function() okButtonDidTap;

  const IndividualPaymentScreen({
    Key? key,
    required this.okButtonDidTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final info = ModalRoute.of(context)?.settings.arguments
        as IndividualPaymentInformation?;
    final name = info?.customer.fullName ?? '';
    final price = info?.course.formattedPrice ?? '';
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
                  key: IndividualPaymentConstants.titleKey,
                  'One step ahead!',
                  style: Theme.of(context).textTheme.headline3,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  key: IndividualPaymentConstants.subtitleKey,
                  name,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  key: IndividualPaymentConstants.priceKey,
                  'Price: $price',
                  style: Theme.of(context).textTheme.headline1,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  key: IndividualPaymentConstants.paymentMethodTitleKey,
                  'Payment method',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                const SizedBox(
                  height: 5,
                ),
                Image(
                  key: IndividualPaymentConstants.paymentQrImageKey,
                  image: AssetImage(
                    IndividualPaymentConstants.paymentQrImage,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  key: IndividualPaymentConstants.paymentDescriptionKey,
                  'Please send the payment slip to this email jane@odds.team',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  key: IndividualPaymentConstants.okButtonKey,
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
