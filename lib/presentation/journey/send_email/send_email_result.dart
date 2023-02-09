import 'package:flutter/material.dart';
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
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Back',
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
