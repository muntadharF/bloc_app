import 'package:flutter/material.dart';

import '../../constants/app_strings.dart';
import '../widgets/api/online_widgets_for_api.dart';
import '../widgets/common/body_of_screen.dart';

class ApiScreen extends StatelessWidget {
  const ApiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.appBarApiText)),
      body: const BodyOfScreen(onlineWidgets: OnlineWidgetsForApi()),
    );
  }
}
