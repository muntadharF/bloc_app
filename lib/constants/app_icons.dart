import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_dimensions.dart';

class AppIcons {
  AppIcons._();

  static const Icon increment = Icon(
    Icons.plus_one,
    color: AppColors.white,
    size: AppDimensions.counterIconSize,
  );

  static const Icon decrement = Icon(
    Icons.exposure_neg_1_outlined,
    color: AppColors.white,
    size: AppDimensions.counterIconSize,
  );
}
