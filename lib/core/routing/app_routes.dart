/// Centralized route paths used with GoRouter. As new features (Home,
/// Cart, Checkout, etc.) are built, their routes get added here so the
/// whole navigation graph is visible from one file.
abstract class AppRoutes {
  AppRoutes._();

  static const String splash = '/';
  static const String onboarding = '/onboarding';

  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';
  static const String forgotPassword = '/forgot-password';
  static const String resetPassword = '/reset-password';

  static const String home = '/home';
  static const String categories = '/categories';
  static const String categoryProducts = '/category-products';
  static const String search = '/search';
  static const String productDetails = '/product-details/:id';
  static String productDetailsPath(String id) => '/product-details/$id';
  static const String wishlist = '/wishlist';
  static const String cart = '/cart';
  static const String checkout = '/checkout';
  static const String profile = '/profile';
  static const String orders = '/orders';
  static const String orderTracking = '/order-tracking';
  static const String notifications = '/notifications';
}
