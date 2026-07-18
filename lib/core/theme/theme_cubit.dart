import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/local_storage_service.dart';

/// Manages the app's [ThemeMode] and persists the user's choice so it
/// survives app restarts. Injected as a singleton so any screen (e.g.
/// Settings/Profile) can call `context.read<ThemeCubit>().toggle()`.
class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit(this._storage) : super(_initial(_storage));

  final LocalStorageService _storage;

  static ThemeMode _initial(LocalStorageService storage) {
    switch (storage.themeMode) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  Future<void> setTheme(ThemeMode mode) async {
    emit(mode);
    await _storage.setThemeMode(mode.name);
  }

  Future<void> toggle() async {
    final next = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    await setTheme(next);
  }
}
