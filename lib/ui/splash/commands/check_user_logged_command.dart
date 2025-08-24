import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'check_user_logged_command.g.dart';

@riverpod
final class CheckUserLoggedCommand extends _$CheckUserLoggedCommand {
  @override
  Future<bool?> build() async => null;

  Future<void> execute() async {
    state = const AsyncLoading();
    await Future.delayed(const Duration(milliseconds: 2000));
    state = const AsyncData(false);
  }
}
