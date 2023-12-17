import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';

class AppThemes {
  AppThemes._();

  static const AppBarTheme _appBarTheme = AppBarTheme(
    centerTitle: true,
    color: AppColors.darkPrimary,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: AppColors.darkPrimary,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarDividerColor: AppColors.lightModeBackground,
      systemNavigationBarColor: AppColors.lightModeBackground,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );

  static const TextTheme _textTheme = TextTheme(
    titleLarge: AppTextStyles.titleLarge,
    bodyLarge: AppTextStyles.bodyLarge,
    headlineSmall: AppTextStyles.headlineSmall,
  );

  static ThemeData ligth = ThemeData(
    brightness: Brightness.light,
    appBarTheme: _appBarTheme,
    textTheme: _textTheme,
    colorScheme: const ColorScheme.light().copyWith(
      primary: AppColors.darkPrimary,
      secondary: AppColors.darkPrimary,
    ),
    scaffoldBackgroundColor: AppColors.lightModeBackground,
  );

  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: _appBarTheme,
    textTheme: _textTheme.apply(bodyColor: AppColors.white),
    colorScheme: const ColorScheme.dark().copyWith(
      primary: AppColors.darkPrimary,
      secondary: AppColors.darkPrimary,
    ),
    scaffoldBackgroundColor: AppColors.darkModeBackground,
  );
}
