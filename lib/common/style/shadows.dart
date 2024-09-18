import 'package:flutter/material.dart';
import 'package:my_store/utils/constants/colors.dart';

class AppShadowStyle {
  static final verticalProductShadow = BoxShadow(
      color: AppColors.darkGrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2));

        static final horizantalProductShadow = BoxShadow(
      color: AppColors.darkGrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2));
}
