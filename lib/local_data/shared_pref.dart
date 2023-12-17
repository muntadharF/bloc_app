import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static late SharedPreferences sharedPref;
  static const String keySelectedThemeMode = 'light';

  static Future<void> init() async {
    sharedPref = await SharedPreferences.getInstance();
  }

  static void saveThemeMode(bool isDarkMode) {
    !isDarkMode
        ? sharedPref.setString(keySelectedThemeMode, 'light')
        : sharedPref.setString(keySelectedThemeMode, 'dark');
  }

  static ThemeMode getThemeMode() {
    String? theme = sharedPref.getString(keySelectedThemeMode);

    if (theme == null || theme == 'light') {
      return ThemeMode.light;
    }

    return ThemeMode.dark;
  }
}
