import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

mixin SnackBarMessages<T extends ConsumerStatefulWidget> on ConsumerState<T> {
  void showSnackBar(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }

  void showInfoSnackBar(String message) => showSnackBar(
    message,
    Colors.blue,
  );

  void showSucessSnackBar(String message) => showSnackBar(
    message,
    Colors.green,
  );

  void showErrorSnackBar(String message) => showSnackBar(
    message,
    Colors.red,
  );
}
