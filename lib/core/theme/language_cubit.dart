import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/local_storage_service.dart';

/// Manages the app's [Locale] and persists the choice.
///
/// Real string translation now exists via `flutter gen-l10n` (see
/// `lib/l10n/app_en.arb` / `app_ar.arb` and `AppLocalizations`) for
/// Splash, Onboarding, Auth, bottom navigation, and Home's headers —
/// switching to Arabic both flips layout to RTL (via the
/// `Directionality` wrapper in `main.dart`) *and* shows real Arabic
/// text on those screens. Screens built in earlier steps that haven't
/// been converted to `AppLocalizations.of(context)!.xyz` yet still show
/// their original hardcoded English strings — extending coverage is a
/// matter of adding more keys to both ARB files and swapping the
/// `Text('...')` calls, following the same pattern.
class LanguageCubit extends Cubit<Locale> {
  LanguageCubit(this._storage) : super(_initial(_storage));

  final LocalStorageService _storage;

  static Locale _initial(LocalStorageService storage) {
    return Locale(storage.languageCode ?? 'en');
  }

  Future<void> setLanguage(String languageCode) async {
    emit(Locale(languageCode));
    await _storage.setLanguageCode(languageCode);
  }

  bool get isRtl => state.languageCode == 'ar';
}
