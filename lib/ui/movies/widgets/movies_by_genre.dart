import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'movies_box.dart';

final class MoviesByGenre extends ConsumerStatefulWidget {
  const MoviesByGenre({super.key});

  @override
  ConsumerState createState() => _MoviesByGenreState();
}

final class _MoviesByGenreState extends ConsumerState<MoviesByGenre> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 130),
      child: MoviesBox(
        title: 'Filmes Encontrados',
        isVerticalScroll: true,
      ),
    );
  }
}
