import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/local_storage_service.dart';

/// Manages the app's [Locale] and persists the choice.
///
/// NOTE — scope of what this actually does today: switching to Arabic
/// correctly flips layout direction (RTL) app-wide via the
/// `Directionality` wrapper in `main.dart`, and `flutter_localizations`'
/// delegates handle locale-aware date/number formatting. It does **not**
/// yet translate NovaCart's own UI strings — that requires adding ARB
/// files under a `core/l10n/` directory and running `flutter gen-l10n`,
/// then replacing hardcoded `Text('...')` calls with
/// `AppLocalizations.of(context)!.xyz`. This cubit and the RTL
/// plumbing are the integration point that work is built on top of.
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
