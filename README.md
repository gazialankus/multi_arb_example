# Flutter Tip: Organize Your Localization with Multiple ARB Files Per Language

As your Flutter app grows, so does the complexity of managing its localization. Typically, translations are stored in a single Application Resource Bundle (*.arb) file, but this approach can become unwieldy as more content is added. The challenges of navigating a large ARB file, coupled with the risk of merge conflicts when multiple developers work on translations simultaneously, can slow down your development process.

One solution is to split your ARB file into smaller, more manageable files, is to break your project to sevelar modules. However, if localization is the sole reason you're considering breaking your app into multiple modules, this method might be overengineering. In such cases, simpler alternatives may be more appropriate.

In this article, we'll explore how to effectively split ARB files in case of single module application.

## The Goal
To demonstrate this approach, we'll create a simple Flutter application with two tabs in the bottom navigation bar: "Home" and "Settings". Since it’s logical to organize localization by feature, we'll split the localization files accordingly. This means creating separate ARB files for each feature, resulting in the following structure:

```
- l10n
  - home
    - home_en.arb
    - home_ru.arb
  - settings
    - settings_en.arb
    - settings_ru.arb
```

This organization makes it easier to manage translations for each feature independently, reducing potential conflicts and simplifying navigation within the localization files.

## Step 1: Adding Dependencies	

To begin, we need to set up the necessary dependencies for localization in Flutter. Following the official Flutter [documentation](https://docs.flutter.dev/ui/accessibility-and-internationalization/internationalization), add the following to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_localizations:
    sdk: flutter
  intl: any

# Omitted...

flutter:
  generate: true

```

This configuration will ensure your project is properly equipped for handling localization.

## Step 2: Configuring Localization

Typically, the next step, as outlined in the [Flutter documentation](https://docs.flutter.dev/ui/accessibility-and-internationalization/internationalization), involves adding a `l10n.yaml` file to the root of your project. This file configures the `gen-l10n` tool, which generates the necessary Dart localization files.

However, instead of using a `l10n.yaml` file, we’ll use a Bash script. This approach allows us to generate the localization files for each feature-related ARB folder separately, keeping the process aligned with our folder structure. Create a Bash script with the following content:

```bash
flutter gen-l10n --arb-dir ./lib/l10n/home --template-arb-file home_en.arb --output-localization-file home_localizations.dart --output-class HomeLocalizations &&

flutter gen-l10n --arb-dir ./lib/l10n/settings --template-arb-file settings_en.arb --output-localization-file settings_localizations.dart --output-class SettingsLocalizations
```

This script runs the `gen-l10n` command for each ARB folder corresponding to the "Home" and "Settings" tabs, generating the appropriate Dart files. Once the script is created, run it to generate the necessary localization files.

## Step 3: Demonstrating the Result
To showcase the outcome, I've created a playground application that allows users to switch the app's language in Flutter. You can watch a brief demonstration in this [video](https://youtube.com/shorts/dn_6lMnLmUM?feature=share). The source code for this example can be found on GitHub [here](https://github.com/AlexeyYuPopkov/multi_arb_example). Now, let's break down how it works:

```dart
final class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = View.of(context).platformDispatcher.locale;
// 1
    return ChangeNotifierProvider(
      create: (_) => LanguageProvider(locale: locale),
      child: Consumer<LanguageProvider>(
        builder: (context, state, child) {
          return MaterialApp(
            home: const TabbarScreen(),
            locale: state.currentLanguage,
// 2
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              HomeLocalizations.delegate,
              SettingsLocalizations.delegate,
            ],
// 3
            supportedLocales: const [
              Locale('en'),
              Locale('ru'),
            ],
          );
        },
      ),
    );
  }
}
```

### Explanation:
1. **LanguageProvider:** This class manages the language-switching logic.
2. **Localizations Delegates:** Here, we add the necessary localization delegates to the app, including the delegates generated from the ARB files for the "Home" and "Settings" tabs.
3. **Supported Locales:** We specify the locales supported by the app, in this case, English and Russian.

## Step 4: Usage Example

To retrieve localized titles for the "Home" and "Settings" screens, you can use the following code:

```dart
import 'package:flutter_gen/gen_l10n/home_localizations.dart';
import 'package:flutter_gen/gen_l10n/settings_localizations.dart';

extension Localization on BuildContext {

// 1
  String get homeScreenTitle => HomeLocalizations.of(this)!.home_screen_title;

// 2
  String get settingsScreenTitle => SettingsLocalizations.of(this)!.settings_screen_title;
}
```

### Explanation:
1. **Home Screen Title:** This extension method retrieves the localized title for the "Home screen" using the `HomeLocalizations` class.
2. **Settings Screen Title:** Similarly, this method retrieves the localized title for the "Settings screen" using the `SettingsLocalizations` class.

## Conclusion
Splitting your ARB files by feature, as demonstrated in this article, offers a more organized and scalable approach to managing localization in your Flutter application. By separating the localization data for different features, you reduce the likelihood of merge conflicts, simplify navigation within your ARB files, and align your localization structure more closely with your app’s architecture.

However, there is one trade-off with this approach: the Bash script described in Step 2 must be run manually whenever you update your localization files. This contrasts with the standard approach using `l10n.yaml`, which automatically regenerates localization files during a hot restart. While this additional step introduces a slight inconvenience, the benefits of a more maintainable and conflict-free localization system can far outweigh this minor drawback, especially in larger projects.

In summary, if you're working on a growing Flutter app with multiple features, splitting your ARB files can streamline your localization process and improve collaboration within your team. 
