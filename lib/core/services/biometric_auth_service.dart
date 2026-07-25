import 'package:flutter/foundation.dart';
import 'package:local_auth/local_auth.dart';

/// Thin wrapper around `local_auth`. Kept minimal — this only ever
/// checks device support and runs one authentication prompt; it has no
/// opinion on *when* to call it (that's `SplashCubit` for app-unlock,
/// and the Profile "Biometric Login" toggle for enabling/disabling).
class BiometricAuthService {
  final LocalAuthentication _localAuth = LocalAuthentication();

  Future<bool> isDeviceSupported() async {
    try {
      final canCheck = await _localAuth.canCheckBiometrics;
      final isSupported = await _localAuth.isDeviceSupported();
      return canCheck && isSupported;
    } catch (e) {
      debugPrint('Biometric support check failed: $e');
      return false;
    }
  }

  Future<bool> authenticate({
    String reason = 'Authenticate to unlock NovaCart',
  }) async {
    try {
      return await _localAuth.authenticate(
        localizedReason: reason,
        biometricOnly: false,
        persistAcrossBackgrounding: true,
      );
    } catch (e) {
      debugPrint('Biometric authentication failed: $e');
      return false;
    }
  }
}
