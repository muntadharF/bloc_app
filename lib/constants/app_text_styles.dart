import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const TextStyle titleLarge = TextStyle(
    color: AppColors.black,
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle bodyLarge = TextStyle(
    color: AppColors.white,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle headlineSmall = TextStyle(
    color: AppColors.black,
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );
}
