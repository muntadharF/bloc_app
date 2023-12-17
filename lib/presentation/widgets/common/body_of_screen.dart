import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';

import '../../../constants/app_dimensions.dart';
import 'offline_widgets_for_all_screens.dart';

class BodyOfScreen extends StatelessWidget {
  final Widget onlineWidgets;

  const BodyOfScreen({super.key, required this.onlineWidgets});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.horizontalPadding,
          vertical: AppDimensions.verticalPadding,
        ),
        width: AppDimensions.widthContainer,
        height: AppDimensions.heightContainer,
        child: OfflineBuilder(
          connectivityBuilder: (context, connectivity, child) {
            final bool connected = connectivity != ConnectivityResult.none;

            return connected ? onlineWidgets : const OfflineWidgetsForAllScreens();
          },
          debounceDuration: const Duration(milliseconds: 500),
          child: const SizedBox(),
        ),
      ),
    );
  }
}
