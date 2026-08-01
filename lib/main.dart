import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'core/di/injection_container.dart';
import 'core/routing/app_router.dart';
import 'core/services/push_notification_service.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/language_cubit.dart';
import 'core/theme/theme_cubit.dart';
import 'generated/l10n/app_localizations.dart';
import 'features/cart/presentation/cubit/cart_cubit.dart';
import 'features/comparison/presentation/cubit/comparison_cubit.dart';
import 'features/notifications/presentation/cubit/notifications_cubit.dart';
import 'features/recently_viewed/presentation/cubit/recently_viewed_cubit.dart';
import 'features/wishlist/presentation/cubit/wishlist_cubit.dart';

Future<void> main() async {
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  debugPrint('--- App Starting ---');

  bool firebaseInitialized = false;
  try {
    // Attempt Firebase init with a strict timeout
    await Firebase.initializeApp().timeout(const Duration(seconds: 3));
    if (Firebase.apps.isNotEmpty) {
      firebaseInitialized = true;
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    }
  } catch (e) {
    debugPrint('Firebase init timed out or failed: $e');
  }

  // Load core dependencies (LocalStorage, etc.)
  debugPrint('Initializing dependencies...');
  await initDependencyInjection(firebaseInitialized: firebaseInitialized);
  
  // IMMEDIATELY remove splash screen so the user sees the app
  FlutterNativeSplash.remove();
  debugPrint('Splash removed.');

  // Initialize non-critical services in the background
  if (firebaseInitialized) {
    sl<PushNotificationService>().initialize().catchError((e) {
      debugPrint('Notification init error: $e');
    });
  }

  runApp(const NovaCartApp());
}

class NovaCartApp extends StatelessWidget {
  const NovaCartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>.value(value: sl<ThemeCubit>()),
        BlocProvider<LanguageCubit>.value(value: sl<LanguageCubit>()),
        BlocProvider<WishlistCubit>.value(
          value: sl<WishlistCubit>()..ensureStarted(),
        ),
        BlocProvider<CartCubit>.value(
          value: sl<CartCubit>()..ensureStarted(),
        ),
        BlocProvider<NotificationsCubit>.value(value: sl<NotificationsCubit>()),
        BlocProvider<RecentlyViewedCubit>.value(value: sl<RecentlyViewedCubit>()),
        BlocProvider<ComparisonCubit>.value(value: sl<ComparisonCubit>()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return BlocBuilder<LanguageCubit, Locale>(
            builder: (context, locale) {
              return MaterialApp.router(
                title: 'NovaCart',
                debugShowCheckedModeBanner: false,
                theme: AppTheme.light,
                darkTheme: AppTheme.dark,
                themeMode: themeMode,
                locale: locale,
                supportedLocales: AppLocalizations.supportedLocales,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                // Guarantees RTL layout mirroring for Arabic even before
                // full string translation (ARB files) is added — see
                // the note in `LanguageCubit`.
                builder: (context, child) => Directionality(
                  textDirection:
                      locale.languageCode == 'ar' ? TextDirection.rtl : TextDirection.ltr,
                  child: child!,
                ),
                routerConfig: AppRouter.router,
              );
            },
          );
        },
      ),
    );
  }
}
