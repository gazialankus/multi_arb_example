import 'package:flutter/material.dart';
import 'package:multi_arb_example/language_provider.dart';
import 'package:provider/provider.dart';

part 'settings_screen_widgets_part.dart';

final class SettingsScreen extends StatelessWidget {
  static const _langs = LanguageProvider.supportedLocales;

  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.settingsScreenTitle),
      ),
      body: Consumer<LanguageProvider>(
        builder: (context, state, child) {
          return ListView.builder(
            prototypeItem: const SizedBox(height: 50.0),
            itemCount: _langs.length,
            itemBuilder: (context, index) {
              return _ItemWidget(
                isSelected: state.currentLanguage.languageCode ==
                    _langs[index].languageCode,
                item: _langs[index],
                onTap: () => _onTap(context, newLocale: _langs[index]),
              );
            },
          );
        },
      ),
    );
  }

  void _onTap(BuildContext context, {required Locale newLocale}) {
    context.read<LanguageProvider>().currentLanguage = newLocale;
  }
}

extension on Locale {
  String name(BuildContext context) {
    switch (languageCode) {
      case 'en':
        return context.englishLanguageName;
      case 'ru':
        return context.russianLanguageName;
      default:
        assert(false, 'Impossible case');
        return '';
    }
  }
}
