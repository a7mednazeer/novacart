import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';

import '../network/dio_client.dart';
import '../services/local_storage_service.dart';
import '../theme/theme_cubit.dart';
import '../../features/splash/presentation/cubit/splash_cubit.dart';

/// Global Service Locator.
///
/// We use GetIt directly (rather than the `injectable` code-generator)
/// for full control and readability while the app is under active,
/// incremental construction. Registration order matters: register
/// leaf dependencies (storage, network clients) before the
/// repositories/cubits that consume them.
final GetIt sl = GetIt.instance;

Future<void> initDependencyInjection() async {
  // ---------------------------------------------------------------------
  // External / Firebase / third-party singletons
  // ---------------------------------------------------------------------
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  sl.registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance);
  sl.registerLazySingleton<Dio>(() => DioClient.create());

  // ---------------------------------------------------------------------
  // Core services
  // ---------------------------------------------------------------------
  final localStorage = await LocalStorageService.init();
  sl.registerLazySingleton<LocalStorageService>(() => localStorage);

  // ---------------------------------------------------------------------
  // App-wide Cubits (single instance shared across the whole widget tree)
  // ---------------------------------------------------------------------
  sl.registerLazySingleton<ThemeCubit>(() => ThemeCubit(sl()));

  // ---------------------------------------------------------------------
  // Feature: Splash
  // ---------------------------------------------------------------------
  sl.registerFactory<SplashCubit>(() => SplashCubit(sl()));

  // Feature registrations (Auth, Home, Cart, ...) are appended here as
  // each feature's data/domain/presentation layers are built.
}
