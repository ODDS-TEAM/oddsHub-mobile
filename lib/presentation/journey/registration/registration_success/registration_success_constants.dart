import 'package:flutter/material.dart';

class RegistrationSuccessConstants {
  static Key titleKey = const Key(
    'registration_success_title',
  );
  static Key subtitleKey = const Key(
    'registration_success_sub_title',
  );
  static Key paymentMethodTitleKey = const Key(
    'registration_success_payment_method_title',
  );
  static Key priceKey = const Key(
    'registration_success_payment_price',
  );
  static Key paymentQrImageKey = const Key(
    'registration_success_payment_qr_image',
  );
  static Key paymentDescriptionKey = const Key(
    'registration_success_payment_description',
  );
  static Key okButtonKey = const Key(
    'registration_success_ok_button',
  );

  static String paymentQrImage = 'assets/images/registration/payment_qr.jpeg';
}
