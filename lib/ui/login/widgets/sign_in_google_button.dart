import 'package:flutter/material.dart';

import '../../core/themes/app_text_styles.dart';
import '../../core/themes/resource.dart';

final class SignInGoogleButton extends StatelessWidget {
  const SignInGoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: EdgeInsets.zero,
      ),
      onPressed: () {},
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Image.asset(
              R.ASSETS_IMAGES_GOOGLE_LOGO_PNG,
              excludeFromSemantics: true,
            ),
          ),
          const Text(
            'Entrar com o Google',
            style: AppTextStyles.darkGreyRegular,
          ),
        ],
      ),
    );
  }
}
