import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

import 'core/di/injection_container.dart';
import 'core/routing/app_router.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // NOTE: Run `flutterfire configure` to generate `firebase_options.dart`,
  // then switch this to:
  //   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // Left as a platform-config-driven init for now so the app still runs
  // before Firebase is wired up, since we're building screen by screen.
  try {
    await Firebase.initializeApp();
  } catch (e) {
    debugPrint('Firebase not configured yet: $e');
  }

  await initDependencyInjection();

  runApp(const NovaCartApp());
}

class NovaCartApp extends StatelessWidget {
  const NovaCartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>.value(value: sl<ThemeCubit>()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp.router(
            title: 'NovaCart',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: themeMode,
            routerConfig: AppRouter.router,
          );
        },
      ),
    );
  }
}
