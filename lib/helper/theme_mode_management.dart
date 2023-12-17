import 'package:flutter/material.dart';

class ThemeModeManagement with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  get getThemeMode => _themeMode;
  set setThemeMode(ThemeMode newValue) => _themeMode = newValue;

  void changeThemeMode(bool isDarkMode) {
    setThemeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
