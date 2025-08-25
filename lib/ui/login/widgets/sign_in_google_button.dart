import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../core/themes/app_text_styles.dart';
import '../../core/themes/resource.dart';

final class SignInGoogleButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isLoading;

  const SignInGoogleButton({
    super.key,
    required this.onPressed,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: EdgeInsets.zero,
      ),
      onPressed: onPressed,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Visibility(
              visible: !isLoading,
              replacement: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: LoadingAnimationWidget.threeArchedCircle(
                  color: Colors.black,
                  size: 20,
                ),
              ),
              child: Image.asset(
                R.ASSETS_IMAGES_GOOGLE_LOGO_PNG,
                excludeFromSemantics: true,
              ),
            ),
          ),
          Text(
            'Entrar com o Google',
            style: !isLoading
                ? AppTextStyles.darkGreyRegular
                : AppTextStyles.lightGreyRegular,
          ),
        ],
      ),
    );
  }
}
