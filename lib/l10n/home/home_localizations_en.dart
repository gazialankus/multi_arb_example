// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'home_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class HomeLocalizationsEn extends HomeLocalizations {
  HomeLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get title => 'Welcome';

  @override
  String get home_screen_label_content => 'Hello World!';

  @override
  String get home_screen_tab_name_home => 'Home';
}
