import 'package:flutter/material.dart';

import '../../../constants/app_dimensions.dart';
import '../common/navigation_button.dart';
import 'row_of_counter.dart';

class OnlineWidgetsForCounter extends StatelessWidget {
  const OnlineWidgetsForCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RowOfCounter(),
        SizedBox(height: AppDimensions.superX2Large),
        NavigationButton(isApiScreen: false),
        SizedBox(height: AppDimensions.superX6Large),
        NavigationButton(isApiScreen: true),
      ],
    );
  }
}
