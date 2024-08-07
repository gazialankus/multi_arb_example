import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:multi_arb_example/current_language_provider.dart';
import 'package:multi_arb_example/tabbar_screen.dart';

void main() {
  runApp(const MyApp());
}

final class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CurrentLanguageProvider(),
      child: Consumer<CurrentLanguageProvider>(
        builder: (context, state, child) {
          return MaterialApp(
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const TabbarScreen(),
            locale: state.currentLanguage,
            localizationsDelegates:
                CurrentLanguageProvider.localizationsDelegates,
            supportedLocales: CurrentLanguageProvider.supportedLocales,
          );
        },
      ),
    );
  }
}
