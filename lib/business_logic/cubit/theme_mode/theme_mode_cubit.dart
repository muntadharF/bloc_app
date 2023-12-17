import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../local_data/shared_pref.dart';

part 'theme_mode_state.dart';

class ThemeModeCubit extends Cubit<ThemeModeState> {
  ThemeMode themeMode = ThemeMode.light;

  ThemeModeCubit() : super(ThemeModeInitial(themeMode: ThemeMode.light));

  void loadingThemeMode() {
    emit(ThemeModeInitial(themeMode: SharedPref.getThemeMode()));
  }

  void toggleThemeMode(bool isDarkMode) {
    themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    emit(ThemeModeIsChanged(themeMode: themeMode));
    SharedPref.saveThemeMode(isDarkMode);
  }
}
