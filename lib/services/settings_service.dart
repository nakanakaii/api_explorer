import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SettingsService {
  var hive = Hive.box('settings');

  Future<ThemeMode> themeMode() async {
    String? theme = await hive.get('theme');
    if (theme == 'system') {
      return ThemeMode.system;
    } else if (theme == 'light') {
      return ThemeMode.light;
    } else if (theme == 'dark') {
      return ThemeMode.dark;
    } else {
      // return ThemeMode.system;
      return ThemeMode.system;
    }
  }

  Future<Locale> locale() async {
    String? data = await hive.get('locale');
    if (data != null) {
      return Locale(data, '');
    } else {
      return const Locale('en', '');
    }
  }

  Future<void> updateThemeMode(ThemeMode theme) async => await hive.put(
        "theme",
        theme.name,
      );

  Future<void> updateLocale(Locale locale) async => await hive.put(
        "locale",
        locale.languageCode,
      );
}
