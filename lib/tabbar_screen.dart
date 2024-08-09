import 'package:flutter/material.dart';
import 'package:multi_arb_example/language_provider.dart';
import 'package:multi_arb_example/home/home_screen.dart';
import 'settings/settings_screen.dart';

final class TabbarScreen extends StatefulWidget {
  const TabbarScreen({super.key});

  @override
  State<TabbarScreen> createState() => _BottomNavigationBarExampleState();
}

final class _BottomNavigationBarExampleState extends State<TabbarScreen> {
  int _selectedIndex = 0;

  static const _tabs = [
    HomeTabModel(),
    SettingsTabModel(),
  ];

  void _onItemTapped(int index) {
    if (_selectedIndex != index) {
      setState(() => _selectedIndex = index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _tabs[_selectedIndex].screenBuilder(context),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          for (final item in _tabs)
            BottomNavigationBarItem(
              icon: item.iconBuilder(context),
              label: item.getTitle(context),
            ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

sealed class TabModel {
  const TabModel();
  String getTitle(BuildContext context);
  Widget screenBuilder(BuildContext context);
  Widget iconBuilder(BuildContext context);
}

final class HomeTabModel extends TabModel {
  const HomeTabModel();

  @override
  String getTitle(BuildContext context) => context.homeScreenTabLabel;

  @override
  Widget screenBuilder(BuildContext context) => const HomeScreen();

  @override
  Widget iconBuilder(BuildContext context) => const Icon(Icons.home);
}

final class SettingsTabModel extends TabModel {
  const SettingsTabModel();

  @override
  String getTitle(BuildContext context) => context.settingsScreenTabLabel;

  @override
  Widget screenBuilder(BuildContext context) => const SettingsScreen();

  @override
  Widget iconBuilder(BuildContext context) => const Icon(Icons.settings);
}
