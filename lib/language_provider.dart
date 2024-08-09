import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/home_localizations.dart';
import 'package:flutter_gen/gen_l10n/settings_localizations.dart';

final class LanguageProvider with ChangeNotifier {
  static const supportedLocales = [
    Locale('en'),
    Locale('ru'),
  ];

  LanguageProvider({required Locale locale}) : _currentLanguage = locale;

  Locale _currentLanguage;

  set currentLanguage(Locale value) {
    if (value != _currentLanguage) {
      _currentLanguage = value;
      notifyListeners();
    }
  }

  Locale get currentLanguage => _currentLanguage;
}

extension Localization on BuildContext {
  HomeLocalizations get homeLocalizations => HomeLocalizations.of(this)!;
  SettingsLocalizations get settingsLocalizations =>
      SettingsLocalizations.of(this)!;

  String get homeScreenTitle => homeLocalizations.home_screen_title;
  String get homeScreenContentText =>
      homeLocalizations.home_screen_label_content;
  String get homeScreenTabLabel => homeLocalizations.home_screen_tab_name_home;

  String get settingsScreenTabLabel =>
      settingsLocalizations.settings_screen_tab_name_settings;
  String get settingsScreenTitle => settingsLocalizations.settings_screen_title;
  String get englishLanguageName =>
      settingsLocalizations.settings_screen_language_name_en;
  String get russianLanguageName =>
      settingsLocalizations.settings_screen_language_name_ru;
}
