import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/themes/resource.dart';
import 'commands/login_with_google_command.dart';
import 'login_view_model.dart';
import 'widgets/sign_in_google_button.dart';

final class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState createState() => _LoginScreenState();
}

final class _LoginScreenState extends ConsumerState<LoginScreen> {
  @override
  Widget build(BuildContext context) {
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
          Column(
            spacing: 48,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 108),
                child: Image.asset(
                  R.ASSETS_IMAGES_LOGO_PNG,
                  excludeFromSemantics: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Consumer(
                  builder: (context, ref, child) {
                    final state = ref.watch(loginWithGoogleCommandProvider);
                    return SignInGoogleButton(
                      isLoading: state.isLoading,
                      onPressed: () {
                        final viewModel = ref.read(loginViewModelProvider);
                        viewModel.googleLogin();
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
