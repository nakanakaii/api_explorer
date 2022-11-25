import 'dart:convert';

import 'package:api_explorer/services/settings_service.dart';
import 'package:flutter/material.dart';

class SettingsController with ChangeNotifier {
  final SettingsService _settingsService;
  late ThemeMode _themeMode;
  late Locale _locale;

  SettingsController(
    this._settingsService,
  );

  Locale get locale => _locale;
  ThemeMode get themeMode => _themeMode;
  Future<void> loadSettings() async {
    _themeMode = await _settingsService.themeMode();
    _locale = await _settingsService.locale();
    notifyListeners();
  }

  Future<void> updateLocale(
    Locale? newLocale,
  ) async {
    if (newLocale == null) return;
    if (newLocale == _locale) return;
    _locale = newLocale;
    notifyListeners();
    await _settingsService.updateLocale(newLocale);
  }

  /// Update and persist the ThemeMode based on the user's selection.
  Future<void> updateThemeMode(
    ThemeMode? newThemeMode,
  ) async {
    if (newThemeMode == null) return;
    if (newThemeMode == _themeMode) return;
    _themeMode = newThemeMode;
    notifyListeners();
    await _settingsService.updateThemeMode(newThemeMode);
  }
}
