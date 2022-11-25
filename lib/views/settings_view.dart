import 'package:api_explorer/controllers/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.
class SettingsView extends StatelessWidget {
  const SettingsView({super.key, required this.controller});

  static const routeName = '/settings';

  final SettingsController controller;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            shrinkWrap: true,
            children: [
              Center(
                child: Text(
                  AppLocalizations.of(context)!.settingsTitle,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              ListTile(
                title: Text(
                  AppLocalizations.of(context)!.settingsTheme,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.black
                        : Colors.white,
                  ),
                ),
                subtitle: Padding(
                  padding: controller.locale.languageCode == 'ar'
                      ? const EdgeInsets.only(right: 15.0)
                      : const EdgeInsets.only(left: 15.0),
                  child: DropdownButton<ThemeMode>(
                    underline: Container(),
                    isDense: true,
                    isExpanded: true,
                    value: controller.themeMode,
                    onChanged: controller.updateThemeMode,
                    items: [
                      DropdownMenuItem(
                        value: ThemeMode.system,
                        child: Text(
                          AppLocalizations.of(context)!.settingsThemeSystem,
                          style: TextStyle(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.black
                                    : Colors.white,
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: ThemeMode.light,
                        child: Text(
                          AppLocalizations.of(context)!.settingsThemeLight,
                          style: TextStyle(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.black
                                    : Colors.white,
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: ThemeMode.dark,
                        child: Text(
                          AppLocalizations.of(context)!.settingsThemeDark,
                          style: TextStyle(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.black
                                    : Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  AppLocalizations.of(context)!.settingsLanguage,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.black
                        : Colors.white,
                  ),
                ),
                subtitle: Padding(
                  padding: controller.locale.languageCode == 'ar'
                      ? const EdgeInsets.only(right: 15.0)
                      : const EdgeInsets.only(left: 15.0),
                  child: DropdownButton<Locale>(
                    underline: Container(),
                    isDense: true,
                    isExpanded: true,
                    value: controller.locale,
                    onChanged: controller.updateLocale,
                    items: [
                      DropdownMenuItem(
                        value: const Locale('ar', ''),
                        child: Text(
                          AppLocalizations.of(context)!.settingsLanguageArabic,
                          style: TextStyle(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.black
                                    : Colors.white,
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: const Locale('en', ''),
                        child: Text(
                          AppLocalizations.of(context)!.settingsLanguageEnglish,
                          style: TextStyle(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.black
                                    : Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
