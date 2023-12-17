import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'business_logic/cubit/theme_mode/theme_mode_cubit.dart';
import 'constants/app_strings.dart';
import 'constants/app_themes.dart';
import 'helper/injection.dart';
import 'local_data/shared_pref.dart';
import 'routes/app_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await SharedPref.init();
  } on Exception catch (e) {
    // ignore: avoid_print
    print('Yes there are "Exception In SharedPref": ${e.toString()}');
  }

  initGetIt();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRoutes _appRoutes = AppRoutes();

  @override
  void dispose() {
    _appRoutes.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeModeCubit()..loadingThemeMode(),
      child: BlocBuilder<ThemeModeCubit, ThemeModeState>(
        builder: (context, state) {
          return MaterialApp(
            title: AppStrings.nameApp,
            theme: AppThemes.ligth,
            darkTheme: AppThemes.dark,
            themeMode: state.themeMode,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: _appRoutes.onGenerateRoute,
          );
        },
      ),
    );
  }
}
