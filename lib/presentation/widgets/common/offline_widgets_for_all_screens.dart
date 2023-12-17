import 'package:flutter/material.dart';

import '../../../constants/app_assets.dart';
import '../../../constants/app_dimensions.dart';
import '../../../constants/app_strings.dart';

class OfflineWidgetsForAllScreens extends StatelessWidget {
  const OfflineWidgetsForAllScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Image(
          image: AssetImage(AppAssets.offlineImage),
          fit: BoxFit.cover,
          width: 324,
          height: 240,
        ),
        const SizedBox(height: AppDimensions.superX5Large),
        Text(
          AppStrings.headerOffline,
          style: Theme.of(context).textTheme.headlineSmall,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppDimensions.superLarge),
        Text(
          AppStrings.titleOffline,
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
