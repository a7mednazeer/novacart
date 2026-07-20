import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

import 'core/di/injection_container.dart';
import 'core/routing/app_router.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_cubit.dart';
import 'features/cart/presentation/cubit/cart_cubit.dart';
import 'features/wishlist/presentation/cubit/wishlist_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  bool firebaseInitialized = false;
  try {
    // Attempt initialization (requires google-services.json / GoogleService-Info.plist)
    await Firebase.initializeApp();
    
    // Verify that the Firebase app was actually created
    if (Firebase.apps.isNotEmpty) {
      firebaseInitialized = true;
    }
  } catch (e) {
    debugPrint('Firebase not configured yet: $e');
  }

  // Tell the dependency injection system whether to use real Firebase or Mock mode.
  await initDependencyInjection(firebaseInitialized: firebaseInitialized);

  runApp(const NovaCartApp());
}

class NovaCartApp extends StatelessWidget {
  const NovaCartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>.value(value: sl<ThemeCubit>()),
        BlocProvider<WishlistCubit>.value(
          value: sl<WishlistCubit>()..ensureStarted(),
        ),
        BlocProvider<CartCubit>.value(
          value: sl<CartCubit>()..ensureStarted(),
        ),
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
