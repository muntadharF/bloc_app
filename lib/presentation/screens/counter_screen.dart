import 'package:flutter/material.dart';

import '../../constants/app_strings.dart';
import '../widgets/common/body_of_screen.dart';
import '../widgets/counter/online_widgets_for_counter.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.nameApp)),
      body: const BodyOfScreen(onlineWidgets: OnlineWidgetsForCounter()),
    );
  }
}
