import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/cubit/counter/counter_cubit.dart';
import '../../../constants/app_dimensions.dart';
import '../../../constants/app_strings.dart';
import '../../../routes/app_pages.dart';

class NavigationButton extends StatelessWidget {
  final bool isApiScreen;

  const NavigationButton({super.key, required this.isApiScreen});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (isApiScreen) {
          Navigator.of(context).pushNamed(AppPages.apiScreen);
          return;
        }
        Navigator.of(context).pushNamed(
          AppPages.themeScreen,
          arguments: context.read<CounterCubit>().counter,
        );
      },
      style: ElevatedButton.styleFrom(
        minimumSize: AppDimensions.minimumSizeNavigationButton,
        maximumSize: AppDimensions.maximumSizeNavigationButton,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppDimensions.navigationButtonBorderRadius),
          ),
        ),
      ),
      child: Text(
        isApiScreen
            ? AppStrings.navigationButtonApiText
            : AppStrings.navigationButtonThemeText,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
