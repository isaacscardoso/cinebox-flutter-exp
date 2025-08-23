import 'package:flutter/material.dart';

import 'ui/splash/splash_screen.dart';

final class CineboxMainApp extends StatelessWidget {
  const CineboxMainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CineBox',
      routes: {'/': (_) => const SplashScreen()},
    );
  }
}
