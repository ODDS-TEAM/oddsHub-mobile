import 'package:flutter/material.dart';
import 'package:oddshub/styles/colors.dart';

class AppShadows {
  static BoxShadow get card {
    return BoxShadow(
      offset: const Offset(0, 4),
      blurRadius: 15,
      spreadRadius: -5,
      color: AppColors.primaryColor.withOpacity(0.25),
    );
  }
}
