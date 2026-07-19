import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'storage_keys.dart';

/// Wraps [SharedPreferences] (non-sensitive prefs) and
/// [FlutterSecureStorage] (tokens/credentials) behind one clean API.
///
/// Nothing outside `core/services` should import `shared_preferences`
/// or `flutter_secure_storage` directly — this keeps the storage
/// mechanism swappable (e.g. moving to Hive) without touching feature
/// code.
class LocalStorageService {
  LocalStorageService(this._prefs, this._secureStorage);

  final SharedPreferences _prefs;
  final FlutterSecureStorage _secureStorage;

  static Future<LocalStorageService> init() async {
    final prefs = await SharedPreferences.getInstance();
    const secureStorage = FlutterSecureStorage();
    return LocalStorageService(prefs, secureStorage);
  }

  // ---------------------------------------------------------------------
  // Onboarding / preferences (non-sensitive → SharedPreferences)
  // ---------------------------------------------------------------------
  bool get hasSeenOnboarding =>
      _prefs.getBool(StorageKeys.hasSeenOnboarding) ?? false;

  Future<void> setHasSeenOnboarding(bool value) =>
      _prefs.setBool(StorageKeys.hasSeenOnboarding, value);

  String? get themeMode => _prefs.getString(StorageKeys.themeMode);

  Future<void> setThemeMode(String mode) =>
      _prefs.setString(StorageKeys.themeMode, mode);

  String? get languageCode => _prefs.getString(StorageKeys.languageCode);

  Future<void> setLanguageCode(String code) =>
      _prefs.setString(StorageKeys.languageCode, code);

  bool get rememberMe => _prefs.getBool(StorageKeys.rememberMe) ?? false;

  Future<void> setRememberMe(bool value) =>
      _prefs.setBool(StorageKeys.rememberMe, value);

  // ---------------------------------------------------------------------
  // Recent searches (non-sensitive → SharedPreferences)
  // ---------------------------------------------------------------------
  static const int _maxRecentSearches = 10;

  List<String> get recentSearches =>
      _prefs.getStringList(StorageKeys.recentSearches) ?? const [];

  Future<void> addRecentSearch(String query) async {
    final trimmed = query.trim();
    if (trimmed.isEmpty) return;

    final updated = [
      trimmed,
      ...recentSearches.where((q) => q.toLowerCase() != trimmed.toLowerCase()),
    ].take(_maxRecentSearches).toList();

    await _prefs.setStringList(StorageKeys.recentSearches, updated);
  }

  Future<void> removeRecentSearch(String query) async {
    final updated = recentSearches.where((q) => q != query).toList();
    await _prefs.setStringList(StorageKeys.recentSearches, updated);
  }

  Future<void> clearRecentSearches() =>
      _prefs.remove(StorageKeys.recentSearches);

  // ---------------------------------------------------------------------
  // Sensitive data (→ SecureStorage)
  // ---------------------------------------------------------------------
  Future<String?> get authToken =>
      _secureStorage.read(key: StorageKeys.authToken);

  Future<void> setAuthToken(String token) =>
      _secureStorage.write(key: StorageKeys.authToken, value: token);

  Future<void> clearAuthToken() =>
      _secureStorage.delete(key: StorageKeys.authToken);

  /// Clears all session-related data on logout while preserving
  /// non-sensitive preferences like theme/language/onboarding state.
  Future<void> clearSession() async {
    await clearAuthToken();
    await _prefs.remove(StorageKeys.cachedUserId);
  }
}
