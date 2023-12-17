part of 'theme_mode_cubit.dart';

@immutable
abstract class ThemeModeState {
  abstract final ThemeMode themeMode;
}

class ThemeModeInitial extends ThemeModeState {
  @override
  final ThemeMode themeMode;

  ThemeModeInitial({required this.themeMode});
}

class ThemeModeIsChanged extends ThemeModeState {
  @override
  final ThemeMode themeMode;

  ThemeModeIsChanged({required this.themeMode});
}

