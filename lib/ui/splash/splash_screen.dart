import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/themes/resource.dart';
import '../core/widgets/loader.dart';
import '../core/widgets/snack_bar_messages.dart';
import 'commands/check_user_logged_command.dart';
import 'splash_view_model.dart';

final class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState createState() => _SplashScreenState();
}

final class _SplashScreenState extends ConsumerState<SplashScreen>
    with Loader, SnackBarMessages {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(splashViewModelProvider).checkLoginAndRedirect();
    });
    super.initState();
  }

  void _redirectTo(String path) {
    Navigator.pushNamedAndRemoveUntil(context, path, (route) => false);
  }

  void _checkLoginAndRedirectListener() {
    ref.listen(checkUserLoggedCommandProvider, (_, next) {
      next.whenOrNull(
        data: (data) {
          final path = switch (data) {
            true => '/home',
            false => '/login',
            _ => '',
          };
          if (path.isNotEmpty && context.mounted) {
            _redirectTo(path);
          }
        },
        error: (error, stackTrace) {
          if (context.mounted) {
            showErrorSnackBar('Erro ao verificar login.');
            _redirectTo('/login');
          }
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    _checkLoginAndRedirectListener();

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            R.ASSETS_IMAGES_BG_LOGIN_PNG,
            fit: BoxFit.cover,
          ),
          const ColoredBox(
            color: Color.fromARGB(170, 0, 0, 0),
          ),
          Center(
            child: Image.asset(
              R.ASSETS_IMAGES_LOGO_PNG,
              excludeFromSemantics: true,
            ),
          ),
        ],
      ),
    );
  }
}
