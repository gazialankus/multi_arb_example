import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:multi_arb_example/language_provider.dart';
import 'package:multi_arb_example/tabbar_screen.dart';
import 'package:multi_arb_example/l10n/home/home_localizations.dart';
import 'package:multi_arb_example/l10n/settings/settings_localizations.dart';

void main() {
  runApp(const MyApp());
}

final class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = View.of(context).platformDispatcher.locale;

    return ChangeNotifierProvider(
      create: (_) => LanguageProvider(locale: locale),
      child: Consumer<LanguageProvider>(
        builder: (context, state, child) {
          return MaterialApp(
            home: const TabbarScreen(),
            locale: state.currentLanguage,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              HomeLocalizations.delegate,
              SettingsLocalizations.delegate,
            ],
            supportedLocales: LanguageProvider.supportedLocales,
          );
        },
      ),
    );
  }
}
