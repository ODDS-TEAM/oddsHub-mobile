import 'package:flutter/material.dart';
import 'package:oddshub/presentation/journey/send_email/send_email_constants.dart';
import 'package:oddshub/routes.dart';
import 'package:oddshub/styles/colors.dart';

class SendEmailResult extends StatelessWidget {
  final IconData? icon;
  final String message;
  final Color color;
  const SendEmailResult({
    Key? key,
    required this.icon,
    required this.message,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: color,
                size: 200,
              ),
              Text(
                message,
                style: Theme.of(context).textTheme.headline1,
              ),
              ElevatedButton(
                key: SendEmailConstants.goToHomeButtonKey,
                onPressed: () {
                  Navigator.popUntil(
                    context,
                    ModalRoute.withName(Routes.home),
                  );
                },
                child: Text(
                  'Go to Home',
                  style: Theme.of(context).textTheme.button?.copyWith(
                        color: AppColors.primaryBackground,
                      ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
