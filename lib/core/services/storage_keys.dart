/// Keys used across SharedPreferences / Hive / SecureStorage.
/// Centralized to avoid typo-based bugs (e.g. reading 'user_Token'
/// somewhere and writing 'user_token' elsewhere).
abstract class StorageKeys {
  StorageKeys._();

  static const String hasSeenOnboarding = 'has_seen_onboarding';
  static const String themeMode = 'theme_mode';
  static const String languageCode = 'language_code';
  static const String authToken = 'auth_token';
  static const String rememberMe = 'remember_me';
  static const String cachedUserId = 'cached_user_id';
  static const String recentSearches = 'recent_searches';
  static const String hasSeededNotifications = 'has_seeded_notifications';
  static const String biometricEnabled = 'biometric_enabled';
}
