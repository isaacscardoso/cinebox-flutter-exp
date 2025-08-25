import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'commands/login_with_google_command.dart';

part 'login_view_model.g.dart';

final class LoginViewModel {
  final LoginWithGoogleCommand _loginWithGoogleCommand;

  const LoginViewModel({
    required LoginWithGoogleCommand loginWithGoogleCommand,
  }) : _loginWithGoogleCommand = loginWithGoogleCommand;

  void googleLogin() => _loginWithGoogleCommand.execute();
}

@riverpod
LoginViewModel loginViewModel(Ref ref) {
  return LoginViewModel(
    loginWithGoogleCommand: ref.watch(
      loginWithGoogleCommandProvider.notifier,
    ),
  );
}
