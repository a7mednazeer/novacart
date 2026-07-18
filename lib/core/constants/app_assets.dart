/// Centralized asset paths. Keeping every asset reference here means a
/// renamed/moved file only needs to be fixed in one place, and typos
/// become compile-time errors instead of silent broken images.
abstract class AppAssets {
  AppAssets._();

  static const String _images = 'assets/images';
  static const String _icons = 'assets/icons';
  static const String _animations = 'assets/animations';

  // Branding
  static const String logo = '$_images/logo.svg';
  static const String logoWhite = '$_images/logo_white.svg';
  static const String appIcon = '$_images/app_icon.png';

  // Onboarding
  static const String onboarding1 = '$_images/onboarding_1.svg';
  static const String onboarding2 = '$_images/onboarding_2.svg';
  static const String onboarding3 = '$_images/onboarding_3.svg';

  // Empty / Error states
  static const String emptyCart = '$_images/empty_cart.svg';
  static const String emptyWishlist = '$_images/empty_wishlist.svg';
  static const String emptySearch = '$_images/empty_search.svg';
  static const String noConnection = '$_images/no_connection.svg';
  static const String genericError = '$_images/generic_error.svg';

  // Icons (custom, non-Material)
  static const String icGoogle = '$_icons/ic_google.svg';
  static const String icApple = '$_icons/ic_apple.svg';

  // Lottie animations
  static const String lottieSplash = '$_animations/splash_loader.json';
  static const String lottieSuccess = '$_animations/success_check.json';
  static const String lottieEmptyBox = '$_animations/empty_box.json';
}
