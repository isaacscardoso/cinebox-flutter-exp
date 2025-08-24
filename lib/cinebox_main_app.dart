import 'package:flutter/material.dart';

import 'ui/core/themes/app_theme.dart';
import 'ui/login/login_screen.dart';
import 'ui/splash/splash_screen.dart';

final class CineboxMainApp extends StatelessWidget {
  const CineboxMainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.theme,
      title: 'CineBox',
      routes: {
        '/': (_) => const SplashScreen(),
        '/login': (_) => const LoginScreen(),
      },
    );
  }
}
