import 'package:flutter/material.dart';

import '../../constants/app_strings.dart';
import '../widgets/common/body_of_screen.dart';
import '../widgets/theme/online_widgets_for_theme.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.nameApp)),
      body: const BodyOfScreen(onlineWidgets: OnlineWidgetsForTheme()),
    );
  }
}
