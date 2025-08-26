import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widgets/movies_app_bar.dart';

final class MoviesScreen extends ConsumerStatefulWidget {
  const MoviesScreen({super.key});

  @override
  ConsumerState createState() => _MoviesScreenState();
}

final class _MoviesScreenState extends ConsumerState<MoviesScreen> {
  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: <Widget>[
        MoviesAppBar(),
      ],
    );
  }
}
