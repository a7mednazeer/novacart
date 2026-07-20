import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:google_sign_in/google_sign_in.dart' as google;

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
import 'package:novacart/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:novacart/features/product/data/datasources/product_remote_datasource.dart';
import 'package:novacart/features/home/data/repositories/home_repository_impl.dart';
import '../../features/home/domain/repositories/home_repository.dart';
import '../../features/home/domain/usecases/get_home_data_usecase.dart';
import '../../features/home/presentation/cubit/home_cubit.dart';
import '../../features/categories/data/repositories/category_repository_impl.dart';
import '../../features/categories/domain/repositories/category_repository.dart';
import '../../features/categories/domain/usecases/get_products_by_category_usecase.dart';
import '../../features/categories/presentation/cubit/category_products_cubit.dart';
import '../../features/search/data/repositories/search_repository_impl.dart';
import '../../features/search/domain/repositories/search_repository.dart';
import '../../features/search/domain/usecases/search_products_usecase.dart';
import '../../features/search/presentation/cubit/search_cubit.dart';
import '../../features/product_details/data/repositories/product_details_repository_impl.dart';
import '../../features/product_details/domain/repositories/product_details_repository.dart';
import '../../features/product_details/domain/usecases/get_product_details_usecase.dart';
import '../../features/product_details/presentation/cubit/product_details_cubit.dart';
import '../services/current_user_service.dart';
import '../../features/product/data/repositories/product_catalog_repository_impl.dart';
import '../../features/product/domain/repositories/product_catalog_repository.dart';
import '../../features/product/domain/usecases/get_products_by_ids_usecase.dart';
import '../../features/wishlist/data/datasources/wishlist_remote_datasource.dart';
import '../../features/wishlist/data/repositories/wishlist_repository_impl.dart';
import '../../features/wishlist/domain/repositories/wishlist_repository.dart';
import '../../features/wishlist/domain/usecases/add_to_wishlist_usecase.dart';
import '../../features/wishlist/domain/usecases/remove_from_wishlist_usecase.dart';
import '../../features/wishlist/presentation/cubit/wishlist_cubit.dart';
import '../../features/cart/data/datasources/cart_remote_datasource.dart';
import '../../features/cart/data/repositories/cart_repository_impl.dart';
import '../../features/cart/domain/repositories/cart_repository.dart';
import '../../features/cart/domain/usecases/add_or_update_cart_item_usecase.dart';
import '../../features/cart/domain/usecases/move_to_cart_usecase.dart';
import '../../features/cart/domain/usecases/move_to_saved_for_later_usecase.dart';
import '../../features/cart/domain/usecases/remove_cart_item_usecase.dart';
import '../../features/cart/domain/usecases/update_cart_quantity_usecase.dart';
import '../../features/cart/presentation/cubit/cart_cubit.dart';
import '../../features/checkout/data/datasources/address_remote_datasource.dart';
import '../../features/checkout/data/datasources/order_remote_datasource.dart';
import '../../features/checkout/data/repositories/address_repository_impl.dart';
import '../../features/checkout/data/repositories/order_repository_impl.dart';
import '../../features/checkout/domain/repositories/address_repository.dart';
import '../../features/checkout/domain/repositories/order_repository.dart';
import '../../features/checkout/domain/usecases/add_address_usecase.dart';
import '../../features/checkout/domain/usecases/delete_address_usecase.dart';
import '../../features/checkout/domain/usecases/set_default_address_usecase.dart';
import '../../features/checkout/domain/usecases/place_order_usecase.dart';
import '../../features/checkout/presentation/cubit/address_management_cubit.dart';
import '../../features/checkout/presentation/cubit/checkout_cubit.dart';
import '../../features/orders/presentation/cubit/order_details_cubit.dart';
import '../../features/orders/presentation/cubit/order_history_cubit.dart';

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
  sl.registerLazySingleton<CurrentUserService>(
    () => CurrentUserService(firebaseInitialized ? sl<FirebaseAuth>() : null),
  );

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

  // ---------------------------------------------------------------------
  // Feature: Categories
  // ---------------------------------------------------------------------
  sl.registerLazySingleton<CategoryRepository>(
    () => CategoryRepositoryImpl(sl()),
  );
  sl.registerLazySingleton(() => GetProductsByCategoryUseCase(sl()));
  sl.registerFactory<CategoryProductsCubit>(
    () => CategoryProductsCubit(sl()),
  );

  // ---------------------------------------------------------------------
  // Feature: Search
  // ---------------------------------------------------------------------
  sl.registerLazySingleton<SearchRepository>(
    () => SearchRepositoryImpl(sl()),
  );
  sl.registerLazySingleton(() => SearchProductsUseCase(sl()));
  sl.registerFactory<SearchCubit>(() => SearchCubit(sl(), sl()));

  // ---------------------------------------------------------------------
  // Feature: Product Details
  // ---------------------------------------------------------------------
  sl.registerLazySingleton<ProductDetailsRepository>(
    () => ProductDetailsRepositoryImpl(sl()),
  );
  sl.registerLazySingleton(() => GetProductDetailsUseCase(sl()));
  sl.registerFactory<ProductDetailsCubit>(() => ProductDetailsCubit(sl()));

  // ---------------------------------------------------------------------
  // Shared: Product Catalog Repository (used by Wishlist + Cart to
  // resolve ids back into full ProductEntity objects)
  // ---------------------------------------------------------------------
  sl.registerLazySingleton<ProductCatalogRepository>(
    () => ProductCatalogRepositoryImpl(sl()),
  );
  sl.registerLazySingleton(() => GetProductsByIdsUseCase(sl()));

  // ---------------------------------------------------------------------
  // Feature: Wishlist (app-wide singleton — shared, synced state)
  // ---------------------------------------------------------------------
  sl.registerLazySingleton<WishlistRemoteDataSource>(
    () => WishlistRemoteDataSource(
      firebaseInitialized ? sl<FirebaseFirestore>() : null,
    ),
  );
  sl.registerLazySingleton<WishlistRepository>(
    () => WishlistRepositoryImpl(sl()),
  );
  sl.registerLazySingleton(() => AddToWishlistUseCase(sl()));
  sl.registerLazySingleton(() => RemoveFromWishlistUseCase(sl()));
  sl.registerLazySingleton<WishlistCubit>(
    () => WishlistCubit(sl(), sl(), sl(), sl(), sl()),
  );

  // ---------------------------------------------------------------------
  // Feature: Cart (app-wide singleton — shared, synced state)
  // ---------------------------------------------------------------------
  sl.registerLazySingleton<CartRemoteDataSource>(
    () => CartRemoteDataSource(
      firebaseInitialized ? sl<FirebaseFirestore>() : null,
    ),
  );
  sl.registerLazySingleton<CartRepository>(() => CartRepositoryImpl(sl()));
  sl.registerLazySingleton(() => AddOrUpdateCartItemUseCase(sl()));
  sl.registerLazySingleton(() => UpdateCartQuantityUseCase(sl()));
  sl.registerLazySingleton(() => RemoveCartItemUseCase(sl()));
  sl.registerLazySingleton(() => MoveToSavedForLaterUseCase(sl()));
  sl.registerLazySingleton(() => MoveToCartUseCase(sl()));
  sl.registerLazySingleton<CartCubit>(
    () => CartCubit(sl(), sl(), sl(), sl(), sl(), sl(), sl(), sl()),
  );

  // ---------------------------------------------------------------------
  // Feature: Checkout (fresh cubit instance per checkout session)
  // ---------------------------------------------------------------------
  sl.registerLazySingleton<AddressRemoteDataSource>(
    () => AddressRemoteDataSource(
      firebaseInitialized ? sl<FirebaseFirestore>() : null,
    ),
  );
  sl.registerLazySingleton<AddressRepository>(
    () => AddressRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<OrderRemoteDataSource>(
    () => OrderRemoteDataSource(
      firebaseInitialized ? sl<FirebaseFirestore>() : null,
    ),
  );
  sl.registerLazySingleton<OrderRepository>(() => OrderRepositoryImpl(sl()));

  sl.registerLazySingleton(() => AddAddressUseCase(sl()));
  sl.registerLazySingleton(() => DeleteAddressUseCase(sl()));
  sl.registerLazySingleton(() => SetDefaultAddressUseCase(sl()));
  sl.registerLazySingleton(() => PlaceOrderUseCase(sl()));

  sl.registerFactory<CheckoutCubit>(
    () => CheckoutCubit(sl(), sl(), sl(), sl()),
  );

  // Standalone address-book cubit reused by Profile's "Saved Addresses".
  sl.registerFactory<AddressManagementCubit>(
    () => AddressManagementCubit(sl(), sl(), sl(), sl(), sl()),
  );

  // ---------------------------------------------------------------------
  // Feature: Orders (history + tracking) — reuses Checkout's OrderRepository
  // ---------------------------------------------------------------------
  sl.registerFactory<OrderHistoryCubit>(
    () => OrderHistoryCubit(sl(), sl()),
  );
  // Parameterized factory: each Order Tracking screen needs its own
  // cubit instance scoped to one order id.
  sl.registerFactoryParam<OrderDetailsCubit, String, void>(
    (orderId, _) => OrderDetailsCubit(sl(), sl(), orderId),
  );
}
