import 'package:flutter/material.dart';
import 'package:multi_arb_example/current_language_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.homeScreenTitle),
      ),
      body: Center(
        child: Text(context.homeScreenContentText),
      ),
    );
  }
}
