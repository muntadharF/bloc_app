import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/cubit/theme_mode/theme_mode_cubit.dart';
import '../counter/row_of_counter.dart';

class OnlineWidgetsForTheme extends StatelessWidget {
  const OnlineWidgetsForTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [RowOfCounter(), SwitchThemeMode()],
    );
  }
}

class SwitchThemeMode extends StatelessWidget {
  const SwitchThemeMode({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeModeCubit, ThemeModeState>(
      builder: (context, state) {
        return Switch(
          value: state.themeMode == ThemeMode.dark,
          onChanged: (bool value) {
            BlocProvider.of<ThemeModeCubit>(context).toggleThemeMode(value);
          },
        );
      },
    );
  }
}
