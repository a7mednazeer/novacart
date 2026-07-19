import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart' as google;
import 'package:dio/dio.dart';

import '../network/dio_client.dart';
import '../services/local_storage_service.dart';
import '../theme/theme_cubit.dart';
import '../../features/splash/presentation/cubit/splash_cubit.dart';
import '../../features/onboarding/presentation/cubit/onboarding_cubit.dart';
import '../../features/auth/data/datasources/auth_remote_datasource.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecases/forgot_password_usecase.dart';
import '../../features/auth/domain/usecases/google_sign_in_usecase.dart';
import '../../features/auth/domain/usecases/sign_in_usecase.dart';
import '../../features/auth/domain/usecases/sign_out_usecase.dart';
import '../../features/auth/domain/usecases/sign_up_usecase.dart';
import '../../features/auth/presentation/cubit/auth_cubit.dart';
import '../../features/product/data/datasources/product_remote_datasource.dart';
import '../../features/home/data/repositories/home_repository_impl.dart';
import '../../features/home/domain/repositories/home_repository.dart';
import '../../features/home/domain/usecases/get_home_data_usecase.dart';
import '../../features/home/presentation/cubit/home_cubit.dart';

/// Global Service Locator.
///
/// We use GetIt directly (rather than the `injectable` code-generator)
/// for full control and readability while the app is under active,
/// incremental construction. Registration order matters: register
/// leaf dependencies (storage, network clients) before the
/// repositories/cubits that consume them.
final GetIt sl = GetIt.instance;

Future<void> initDependencyInjection({bool firebaseInitialized = false}) async {
  // ---------------------------------------------------------------------
  // External / Firebase / third-party singletons
  // ---------------------------------------------------------------------
  if (firebaseInitialized) {
    sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
    sl.registerLazySingleton<FirebaseFirestore>(
        () => FirebaseFirestore.instance);
  }

  sl.registerLazySingleton<Dio>(() => DioClient.create());
  sl.registerLazySingleton<google.GoogleSignIn>(() => google.GoogleSignIn.instance);

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
  sl.registerFactory<SplashCubit>(
    () => SplashCubit(
      sl(),
      firebaseInitialized ? sl<FirebaseAuth>() : null,
    ),
  );

  // ---------------------------------------------------------------------
  // Feature: Onboarding
  // ---------------------------------------------------------------------
  sl.registerFactory<OnboardingCubit>(() => OnboardingCubit(sl()));

  // ---------------------------------------------------------------------
  // Feature: Auth
  // ---------------------------------------------------------------------
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(
      firebaseAuth: firebaseInitialized ? sl<FirebaseAuth>() : null,
      firestore: firebaseInitialized ? sl<FirebaseFirestore>() : null,
      googleSignIn: sl(),
    ),
  );
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(sl()),
  );

  sl.registerLazySingleton(() => SignInUseCase(sl()));
  sl.registerLazySingleton(() => SignUpUseCase(sl()));
  sl.registerLazySingleton(() => ForgotPasswordUseCase(sl()));
  sl.registerLazySingleton(() => GoogleSignInUseCase(sl()));
  sl.registerLazySingleton(() => SignOutUseCase(sl()));

  // Factory: each screen (Sign In / Sign Up / Forgot Password / Home
  // logout button) gets its own fresh AuthCubit instance.
  sl.registerFactory<AuthCubit>(
    () => AuthCubit(
      signInUseCase: sl(),
      signUpUseCase: sl(),
      forgotPasswordUseCase: sl(),
      googleSignInUseCase: sl(),
      signOutUseCase: sl(),
      localStorage: sl(),
    ),
  );

  // Feature registrations (Cart, Checkout, ...) are appended here as
  // each feature's data/domain/presentation layers are built.

  // ---------------------------------------------------------------------
  // Feature: Product (shared catalog data source)
  // ---------------------------------------------------------------------
  sl.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSource(
      firebaseInitialized ? sl<FirebaseFirestore>() : null,
    ),
  );

  // ---------------------------------------------------------------------
  // Feature: Home
  // ---------------------------------------------------------------------
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(sl()),
  );
  sl.registerLazySingleton(() => GetHomeDataUseCase(sl()));
  sl.registerFactory<HomeCubit>(() => HomeCubit(sl()));
}
