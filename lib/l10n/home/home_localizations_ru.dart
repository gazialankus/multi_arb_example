// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'home_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class HomeLocalizationsRu extends HomeLocalizations {
  HomeLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get title => 'Добро пожаловать';

  @override
  String get home_screen_label_content => 'Привет Мир!';

  @override
  String get home_screen_tab_name_home => 'Дом';
}
