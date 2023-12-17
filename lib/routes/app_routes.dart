import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../business_logic/cubit/counter/counter_cubit.dart';
import '../business_logic/cubit/user/user_cubit.dart';
import '../helper/injection.dart';
import '../presentation/screens/api_screen.dart';
import '../presentation/screens/counter_screen.dart';
import '../presentation/screens/theme_screen.dart';
import 'app_pages.dart';

class AppRoutes {
  final CounterCubit _counterCubit = CounterCubit();

  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppPages.counterScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: _counterCubit,
            child: const CounterScreen(),
          ),
        );

      case AppPages.themeScreen:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider.value(value: _counterCubit),
            ],
            child: const ThemeScreen(),
          ),
        );

      case AppPages.apiScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<UserCubit>(),
            // create: (context) => getIt<UserCubit>()..getAllUsers(),
            child: const ApiScreen(),
          ),
        );
    }

    return null;
  }

  void dispose() {
    _counterCubit.close();
  }
}
