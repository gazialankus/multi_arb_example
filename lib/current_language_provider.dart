import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final class CurrentLanguageProvider with ChangeNotifier {
  static const supportedLocales = [
    Locale('en'),
    Locale('ru'),
  ];

  static Iterable<LocalizationsDelegate<dynamic>>? get localizationsDelegates =>
      const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ];

  var _currentLanguage = const Locale('en');

  set currentLanguage(Locale value) {
    if (value != _currentLanguage) {
      _currentLanguage = value;
      notifyListeners();
    }
  }

  Locale get currentLanguage => _currentLanguage;
}

extension Localization on BuildContext {
  AppLocalizations get appLocalizations => AppLocalizations.of(this)!;

  String get homeScreenTitle => appLocalizations.home_screen_title;
  String get homeScreenContentText =>
      appLocalizations.home_screen_label_content;
  String get homeScreenTabLabel => appLocalizations.home_screen_tab_name_home;

  String get settingsScreenTabLabel =>
      appLocalizations.settings_screen_tab_name_settings;
  String get settingsScreenTitle => appLocalizations.settings_screen_title;
  String get englishLanguageName =>
      appLocalizations.settings_screen_language_name_en;
  String get russianLanguageName =>
      appLocalizations.settings_screen_language_name_ru;
}
